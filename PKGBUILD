# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=joaoleal
_pkgname=CppADCodeGen
pkgname=cppadcodegen
pkgver=2.4.2
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
sha256sums=('c9c9d25e519d3235d63cc379fc3d9b3441e1efd5c9a4e35a827c42284b289184')

build() {
    cd "$_pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
