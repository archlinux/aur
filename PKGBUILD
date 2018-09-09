# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

_pkgname=libpaper
pkgname=lib32-${_pkgname}
pkgver=1.1.24
pkgrel=2
pkgdesc='Library for handling paper characteristics (32-bit)'
arch=('x86_64')
url='https://packages.debian.org/unstable/source/libpaper'
license=('GPL')
depends=('lib32-glibc' 'libpaper')
makedepends=('lib32-gcc-libs')
source=("http://ftp.de.debian.org/debian/pool/main/libp/${_pkgname}/${_pkgname}_${pkgver}+nmu5.tar.gz")
sha256sums=('e29deda4cd7350189c71af0925cbf4a4473f9841d1419a922e1e8ff1954db1f2')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}+nmu5"
  autoreconf -vfi
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}+nmu5"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}+nmu5"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
