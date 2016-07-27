# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=feed_parser-git
pkgver=0.1.0.r46.4846071
pkgrel=1
pkgdesc="Parse RSS and Atom feeds in C++"
arch=('i686' 'x86_64')
url="https://github.com/ohmyarch/feed_parser"
license=('GPL' 'LGPL3')
depends=('cpprestsdk-git')
makedepends=('git' 'cmake>=3.5.2')
conflicts=('feed_parser')
provides=('feed_parser')
source=("git://github.com/ohmyarch/feed_parser.git")
sha512sums=('SKIP')

pkgver() {
  cd feed_parser
  echo "0.1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd feed_parser
  git submodule init
  git submodule update
  cd ../build
  cmake ../feed_parser \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
