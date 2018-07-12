# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=gr-limesdr-git
pkgver=r19.3234d26
pkgrel=1
pkgdesc="gr-limesdr Plugin for GNURadio"
arch=('any')
url="https://github.com/myriadrf/gr-limesdr"
license=('MIT')
optdepends=(
  'doxygen: generate documentation'
  'swig: bindings'
  'python2: python bindings'
)
depends=('boost' 'gnuradio' 'limesuite')
makedepends=('git' 'cmake')
provides=('gr-limesdr')
conflicts=('gr-limesdr')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/gr-limesdr
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir"/gr-limesdr/build
  cd "$srcdir"/gr-limesdr/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/gr-limesdr/build

  make DESTDIR="$pkgdir" install
}
