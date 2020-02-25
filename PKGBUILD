# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=joaoleal
_pkgname=CppADCodeGen
pkgname=cppadcodegen
pkgver=2.4.0
pkgrel=1
pkgdesc="A C++ Algorithmic Differentiation Package"
arch=('any')
url="https://github.com/$pkgorg/$_pkgname"
license=('GPL3')
depends=('cppad')
optdepends=('eigen: required when DAE differentiation index reduction is used',
            'valgrind: memcheck test'
            'clang: only required for JIT compilation'
            'llvm: only required for JIT compilation')
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8bb6c7a7ef9cceb5efad65d8a547e36ac67a825025d168b9773af755a800b34b')

build() {
    cd "$_pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
