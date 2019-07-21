# Maintainer: Petr Manek <pm+aur at petrmanek dot cz>

pkgname=mio-git
_pkgname=mio
pkgver=r118.b9737f6
pkgrel=2
pkgdesc="Cross-platform C++11 header-only library for memory mapped file IO"
arch=(any)
license=(MIT)
makedepends=(git cmake make)
depends=()
provides=(mio)
source=("git://github.com/mandreyel/mio")
url="https://github.com/mandreyel/mio"
md5sums=(SKIP)

pkgver() {
  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  cd mio &&
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # instructions from https://github.com/mandreyel/mio
  cd mio &&
  mkdir -p build &&
  cd build &&
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" \
    -DBUILD_TESTING=True .. &&
  make
}

check() {
  # instructions from https://github.com/mandreyel/mio#testing
  cd mio/build &&
  make test
}

package() {
  # instructions from https://github.com/mandreyel/mio#installation
  cd mio/build &&
  make install &&
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


