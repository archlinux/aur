# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bestperformance
pkgver=1.0.8
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems configured for maximal performance."
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('GPLv3')
depends=('cryptominisat5' 'glpk-cut-log' 'symfpu-cvc5' 'libpoly-git' 'libedit' 'cadical-pic' 'cln' 'libbsd')
optdepends=('python-cvc5: Python bindings for cvc5')
makedepends=('bash' 'gcc' 'cmake' 'python3' 'python-tomli' 'python-pyparsing' 'python-scikit-build' 'cython' 'java-environment')
source=("$url/archive/refs/tags/cvc5-$pkgver.tar.gz")
sha256sums=('9b61c6e27609db154657f105d7271a03b7798047b3aab1ca2ab58910fac788ba')
provides=("cvc5=$pkgver")
conflicts=('cvc5-bin' 'cvc5')

build(){
	cd "$srcdir/cvc5-cvc5-$pkgver"
	./configure.sh --prefix=/usr --java-bindings --best --gpl
	cd build
	make
}

# check(){
# 	cd "$srcdir/cvc5-cvc5-$pkgver/build"
# 	DESTDIR="$srcdir/cvc5-cvc5-$pkgver/build/install" make install
# 	cd "$srcdir/cvc5-cvc5-$pkgver/examples"
# 	mkdir -p build && cd build
# 	cmake -DCMAKE_PREFIX_PATH="$srcdir/cvc5-cvc5-$pkgver/build/install/usr/lib/cmake" ..
# 	make
# 	ctest
# }

package() {
	cd "$srcdir/cvc5-cvc5-$pkgver"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/cvc5/LICENSE"
	cd build
	DESTDIR=$pkgdir/usr make install
}
