# Maintainer:
# Contributor: FFY00 <filipe.lains@gmail.com>

_pkgname='gr-limesdr'
pkgname="$_pkgname-git"
pkgver=3.0.1.r69.gd0fac85
pkgrel=1
pkgdesc='gr-limesdr Plugin for GNURadio'
arch=('x86_64')
url='https://github.com/myriadrf/gr-limesdr'
license=('MIT')
depends=(
  'boost'
  'doxygen'
  'gnuradio'
  'graphviz'
  'limesuite'
  'python'
  'swig'
)
makedepends=(
  'cmake'
  'git'
  'pybind11'
)
optdepends=(
  'python: python bindings'
)
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_pkgname"::"git+$url#branch=gr-3.10"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/$_pkgname"
  cd build

  make DESTDIR="$pkgdir" install

  install -Dm 644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
