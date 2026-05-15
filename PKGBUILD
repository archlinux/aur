# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=taglib
pkgname=lib32-taglib
pkgver=2.3
pkgrel=1
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (32 bit)"
arch=('x86_64')
url="https://developer.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=($_pkgname 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('cmake' 'utf8cpp')
source=("https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz")
md5sums=('5c38962970c698f8d18beddef0df7f9a')
sha256sums=('7349f6fd942418bc7009ebe743eb7c9d055f02921ec56fa436ec25007c47fd38')

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
