# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=('x86_64' 'aarch64')
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=('cadical')
makedepends=('bash')
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/cvc5-$pkgver/cvc5-Linux-x86_64-static.zip")
source_aarch64=("$pkgname-$pkgver.zip::$url/releases/download/cvc5-$pkgver/cvc5-Linux-arm64-static.zip")
sha256sums_x86_64=('d18f174ff9a11923c32c3f871f844ed16bd77a28f51050b8e7c8d821c98a1c2e')
sha256sums_aarch64=('d18f174ff9a11923c32c3f871f844ed16bd77a28f51050b8e7c8d821c98a1c2e')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	_pkg=${srcdir}/cvc5-Linux-x86_64-static
	if [ "${CARCH}" = "aarch64" ]; then
        _pkg=${srcdir}/cvc5-Linux-arm64-static
    fi
	mkdir -p $pkgdir/usr
	cp -r ${_pkg}/* $pkgdir/usr
	rm $pkgdir/usr/lib/libcadical* $pkgdir/usr/lib/libpicpoly* $pkgdir/usr/lib/pkgconfig/gmp.pc $pkgdir/usr/lib/pkgconfig/gmpxx.pc
	chmod +x $pkgdir/usr/bin/cvc5
}
