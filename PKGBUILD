# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=sciplot
_author=sciplot

pkgname=${_name}-git
pkgver=v0.2.2.r59.gd568f1f
pkgrel=2
pkgdesc="A modern C++ scientific plotting library powered by gnuplot"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=('gnuplot')
makedepends=('git' 'cmake' 'make')
provides=('sciplot')
conflicts=('sciplot')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
