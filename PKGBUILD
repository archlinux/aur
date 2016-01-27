# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Limao Luo <luolimao+AUR at gmail dot com>

pkgname=lib32-libdv
pkgver=1.0.0
pkgrel=3
pkgdesc="The Quasar DV codec (libdv) is a software codec for DV video (32-bit)"
arch=('x86_64')
url="http://libdv.sourceforge.net/"
license=('LGPL')
depends=("${pkgname#lib32-}" 'lib32-glibc' 'popt')
makedepends=('gcc-multilib' 'lib32-gtk2' 'lib32-libxv')
optdepends=('lib32-gtk2: for using playdv'
            'lib32-libxv: for using playdv')
options=('!libtool')
source=("http://downloads.sourceforge.net/${pkgname#lib32-}/${pkgname#lib32-}-${pkgver}.tar.gz")
sha512sums=('19887a6f452fa7da8924901ad841f5c4a434a3bde56c932ddb43717592aa744281e3a8ad220231e11d7e6bc3b0e704952a8324e5f85d4e088675edceeeca7dc8')

build() {
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export CPPFLAGS+=" -I/usr/lib32/glib-2.0/include/ -I/usr/include/glib-2.0/"
  export CXXFLAGS+=" -I/usr/lib32/glib-2.0/include/ -I/usr/include/glib-2.0/"
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32/ --build=i686-unknown-linux-gnu
  make
}

package() {
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
