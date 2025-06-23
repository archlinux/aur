# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=('x86_64' 'aarch64')
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=('cadical')
makedepends=('bash')
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/cvc5-$pkgver/cvc5-Linux-x86_64-static.zip")
source_aarch64=("$pkgname-$pkgver.zip::$url/releases/download/cvc5-$pkgver/cvc5-Linux-arm64-static.zip")
sha256sums_x86_64=('1e5a30c66f8fc3b65ddac69a3ac299bf03914cc58fc562e0ab6c730bf6bbfe6f')
sha256sums_aarch64=('1e5a30c66f8fc3b65ddac69a3ac299bf03914cc58fc562e0ab6c730bf6bbfe6f')
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
