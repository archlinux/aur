# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname="lib32-libid3tag"
_pkgname="libid3tag"
pkgver=0.16.3
pkgrel=1
pkgdesc="library for id3 tagging, lib32."
arch=('x86_64')
url="https://www.underbit.com/products/mad/"
license=('GPL')
depends=('lib32-zlib' "${_pkgname}")
makedepends=('gperf' 'cmake')
source=($_pkgname-$pkgver::https://codeberg.org/tenacityteam/libid3tag/archive/$pkgver.tar.gz)
md5sums=('77250d3e316e9fcb8eb3560565e59a07')
sha256sums=('0561009778513a95d91dac33cee8418d6622f710450a7cb56a74636d53b588cb')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -W no-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}/usr/include"
}
