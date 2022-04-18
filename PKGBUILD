# Maintainer: RoGuBa <roguba@tutanota.com>

pkgname=gr-limesdr-3.9-git
pkgver=r85.57fc840
pkgrel=1
pkgdesc='gr-limesdr Plugin for GNURadio >=3.9'
arch=('x86_64')
url='https://github.com/chrisjohgorman/gr-limesdr'
license=('GPL')
optdepends=('python: python bindings')
depends=('boost' 'gnuradio' 'limesuite' 'swig' 'python' 'doxygen' 'graphviz')
makedepends=('git' 'cmake')
provides=('gr-limesdr')
conflicts=('gr-limesdr')
source=("git+$url#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
