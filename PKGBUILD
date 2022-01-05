# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=ctpg
_author=peter-winter

pkgname=${_name}-git
pkgver=v1.3.6.r7.gc9b9b44
pkgrel=2
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
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cmake -B build -S ${pkgname} \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCTPG_ENABLE_TESTS=OFF \
        -Wno-dev
}

package() {
  make -C build DESTDIR=$pkgdir install
}
