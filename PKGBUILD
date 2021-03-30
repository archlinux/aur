# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
# Maintainer: Stephanie Wilde-Hobbs <git@stephanie.is>
pkgname=coz-git
pkgver=r487.6dd3c3f
pkgrel=1
pkgdesc="a new kind of profiler that measures optimization potential"
arch=('x86_64')
url="https://github.com/plasma-umass/coz"
license=('BSD')
depends=('libelfin')
makedepends=('git' 'cmake')
source=('coz-git::git+https://github.com/plasma-umass/coz.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  sed -i '/if(INSTALL_COZ)/a include(GNUInstallDirs)' libcoz/CMakeLists.txt
}

build() {
  cd "$srcdir/$pkgname"

  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${pkgname}/build" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
