# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=ctpg
_author=peter-winter

pkgname=${_name}-git
pkgver=1.3.7.r12.g0482730
pkgrel=1
pkgdesc="Compile Time Parser Generator is a C++ single header library which takes a language description as a C++ code and turns it into a LR1 table parser with a deterministic finite automaton lexical analyzer, all in compile time."
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=()
makedepends=('git' 'cmake' 'make')
provides=('ctpg')
conflicts=('ctpg')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

prepare() {
  cmake -B build -S ${pkgname} \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_TESTING=OFF \
        -Wno-dev
}

package() {
  make -C build DESTDIR=$pkgdir install
}
