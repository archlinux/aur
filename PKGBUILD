# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=taglib
pkgname=lib32-taglib
pkgver=2.1.1
pkgrel=1
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats (32 bit)"
arch=('x86_64')
url="https://developer.kde.org/~wheeler/taglib.html"
license=('LGPL' 'MPL')
depends=($_pkgname 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('cmake' 'utf8cpp')
source=("https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz")
md5sums=('9feffe76b4643eb724185310879c3123')
sha256sums=('3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba')

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
