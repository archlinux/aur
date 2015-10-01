# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=heaptrack-git
pkgver=379.cbec4a5
pkgrel=1
pkgdesc="A heap memory profiler"
arch=('i686' 'x86_64')
url="http://milianw.de/tag/heaptrack"
license=('APACHE')
depends=('libunwind' 'elfutils' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
source=('git+git://anongit.kde.org/heaptrack')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/heaptrack"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  export CXXFLAGS="$CXXFLAGS -lboost_iostreams"
  cmake ../heaptrack \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
