# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdoctools-git
pkgver=r186.05ca8f4
pkgrel=1
pkgdesc='KDocTools'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kdoctools'
license=(LGPL)
depends=(karchive-git docbook-xsl)
makedepends=(extra-cmake-modules-git git perl-uri)
conflicts=(kdoctools)
provides=(kdoctools)
options=(staticlibs)
source=('git://anongit.kde.org/kdoctools.git')
md5sums=('SKIP')

pkgver() {
  cd kdoctools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdoctools \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
