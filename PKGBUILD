# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5
pkgver=1.1.2
pkgrel=2
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=('gmp' 'cadical' 'libpoly-git' 'symfpu-cvc5' 'libedit' 'libbsd')
optdepends=('python-cvc5: Python bindings for cvc5')
makedepends=('bash' 'gcc' 'cmake' 'python3' 'python-tomli' 'python-pyparsing'  'python-scikit-build' 'cython' 'java-environment')
checkdepends=('cmake')
source=("$url/archive/refs/tags/cvc5-$pkgver.tar.gz")
sha256sums=('f2eba3f957f5e064e6a87f0dce88fd647932d02014061c8f6a79bf188203993a')
provides=("cvc5=$pkgver")
conflicts=('cvc5-bin' 'cvc5-bestperformance')

build(){
	cd "$srcdir/$pkgname-cvc5-$pkgver"
	./configure.sh --prefix=/usr --java-bindings --editline
	cd build
	make
}

package() {
	cd "$srcdir/$pkgname-cvc5-$pkgver"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/cvc5/LICENSE"
	cd build
	DESTDIR=$pkgdir make install
}
