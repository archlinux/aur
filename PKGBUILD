# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname="lib32-libid3tag"
_pkgname="libid3tag"
pkgver=0.16.4
pkgrel=1
pkgdesc="library for id3 tagging, lib32."
arch=('x86_64')
url="https://www.underbit.com/products/mad/"
license=('GPL')
depends=('lib32-zlib' "${_pkgname}")
makedepends=('gperf' 'cmake')
source=($_pkgname-$pkgver::https://codeberg.org/tenacityteam/libid3tag/archive/$pkgver.tar.gz)
md5sums=('ab4225e9fbb21bddc009838096df827a')
sha256sums=('2e9058af51e5f3881c13c55a9790abb9870812cc0f5917b6f3e825c6ae9b9f39')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -W no-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}/usr/include"
}
