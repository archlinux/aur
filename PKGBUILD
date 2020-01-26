# Maintainer: acxz <akashpatel200 at yahoo dot com>

pkgname=cppadcodegen-git
pkgver=r928.38d4f3b
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
url="https://github.com/joaoleal/CppADCodeGen"
arch=('any')
license=('GPL3' 'EPL1')
depends=('cppad')
optdepends=('eigen: required when DAE differentiation index reduction is used',
            'valgrind: memcheck test'
            'clang: only required for JIT compilation'
            'llvm: only required for JIT compilation')
makedepends=('cmake')
provides=('cppadcodegen')
conflicts=('cppadcodegen')
_pkgname=CppADCodeGen
source=("git+https://github.com/joaoleal/CppADCodeGen.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/${_pkgname}/build"
    cd "$_pkgname/build"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$_pkgname/build"
    make DESTDIR="$pkgdir/" install
}
