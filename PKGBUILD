# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=gr-limesdr-git
pkgver=r79.0a1f587
pkgrel=1
pkgdesc='gr-limesdr Plugin for GNURadio'
arch=('x86_64')
url='https://github.com/myriadrf/gr-limesdr'
license=('MIT')
optdepends=('python: python bindings')
depends=('boost' 'gnuradio' 'limesuite' 'swig' 'python' 'doxygen' 'graphviz')
makedepends=('git' 'cmake')
provides=('gr-limesdr')
conflicts=('gr-limesdr')
source=("git+$url#branch=gr-3.8")
md5sums=('SKIP')

pkgver() {
  cd gr-limesdr

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p gr-limesdr/build
  cd gr-limesdr/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd gr-limesdr/build

  make DESTDIR="$pkgdir" install

  install -Dm 644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
