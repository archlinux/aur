# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Limao Luo <luolimao+AUR at gmail dot com>

_pkgname=libdv
pkgname=lib32-libdv
pkgver=1.0.0
pkgrel=6
pkgdesc="The Quasar DV codec (libdv) is a software codec for DV video (32-bit)"
arch=('x86_64')
url="http://libdv.sourceforge.net/"
license=('LGPL')
depends=("$_pkgname" 'lib32-popt')
source=("https://downloads.sourceforge.net/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha512sums=('19887a6f452fa7da8924901ad841f5c4a434a3bde56c932ddb43717592aa744281e3a8ad220231e11d7e6bc3b0e704952a8324e5f85d4e088675edceeeca7dc8')

build() {
  cd "${srcdir}/$_pkgname-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32/ --disable-gtk --build=i686-unknown-linux-gnu
  make
}

package() {
  cd "${srcdir}/$_pkgname-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
