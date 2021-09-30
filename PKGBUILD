# Maintainer: Chuang Zhu <genelocated at yandex dot com>

pkgname=gnuradio-grnet-git
_reponame=gr-grnet
pkgver=r71.e6dfd14
pkgrel=1
pkgdesc='GNURadio TCP/UDP source and sink blocks rewritten in C++/Boost (gr-grnet)'
url='https://github.com/ghostop14/gr-grnet'
arch=('x86_64')
license=('GPL3')
depends=('gnuradio' 'libpcap')
makedepends=('git' 'cmake' 'boost' 'swig')
replaces=('gr-grnet')
provides=('gnuradio-grnet')
conflicts=('gnuradio-grnet')
source=("git+https://github.com/ghostop14/gr-grnet/#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_reponame"
  mkdir -p build
  cd build
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "$srcdir/$_reponame/build"
  make DESTDIR="$pkgdir" install
}

