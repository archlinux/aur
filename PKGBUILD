# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=taglib
pkgname=lib32-taglib
pkgver=2.3.1
pkgrel=1
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (32 bit)"
arch=('x86_64')
url="https://developer.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=($_pkgname 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('cmake' 'utf8cpp')
source=("https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz")
md5sums=('b189dcfcf284179c04b97a89887e0ce6')
sha256sums=('a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake -B build -S ${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd "$pkgdir/usr"
  rm -rf {include,share}/
  mv bin/taglib-config{,-32}
}
