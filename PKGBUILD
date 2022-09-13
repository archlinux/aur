# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=joaoleal
_pkgname=CppADCodeGen
pkgname=cppadcodegen
pkgver=2.4.3
pkgrel=7
pkgdesc="Source Code Generation for Automatic Differentiation using Operator Overloading"
arch=('any')
url="https://github.com/$pkgorg/$_pkgname"
license=('GPL3')
depends=('cppad')
optdepends=('eigen: required when DAE differentiation index reduction is used',
            'valgrind: memcheck test'
            'clang: only required for JIT compilation'
            'llvm: only required for JIT compilation')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3d3fee920f67b70566fa09ba62203323d4a8100d1ab210c6e7b34f7cb23349fb')

build() {
    cd "$_pkgname-$pkgver"
    export GOOGLETEST_HOME=/usr/src/googletest
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    find "$pkgdir" -name CMakeFiles -delete
}
