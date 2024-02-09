# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=ctbench
_author=jpenuchot

pkgname=${_name}-git
pkgver=1.3.4.r13.ge15b943
pkgrel=1
pkgdesc="Compile-time benchmark and analysis for Clang"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=('gnuplot' 'clang' 'llvm' 'llvm-libs')
makedepends=('nlohmann-json' 'sciplot')
provides=('ctbench')
conflicts=('ctbench')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

prepare() {
  cmake -B build -S ${pkgname} \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
}

package() {
  make -C build DESTDIR=$pkgdir install
}
