# Maintainer: Rajdeep Malakar <rajdeepm.dev@gmail.com>

pkgname="brewkit"
pkgver=1.13.0
pkgrel=1
pkgdesc="the build infra for PKGX"
arch=("x86_64" "arm")
url="https://github.com/pkgxdev/brewkit"
license=("Apache-2.0")
depends=("pkgx" "git")
makedepends=(
	"deno" # For Compiling
)
provides=("brewkit")
conflicts=("brewkit")
source=("bk.sh")
source=("$pkgname.tar.gz::https://github.com/pkgxdev/brewkit/archive/refs/tags/v$pkgver.tar.gz")
# BrewKit Wrapper Script
b2sums=(
	"728ca19ea88c2716eda7b66d5e3db55fa30daef9503820594d3a02555db15d4b7de5ff8fc030890e0ab7ad061ddf1cded7e3b030767efbf5cf9797fcd7fe41aa"
)
# Main Source Archive
b2sums=(
	"6571e3bcb19fecce2f5a32445c6d7f806b8e7aa54a32e96b1fd6b428fa1fa34c1815a97d6613b31b159d19cdc8e302caed5608c9d095e35bb82d53dd8d146001"
)
options=(!strip)

build() {
	mkdir -p "$srcdir/dist"
	cd "$pkgname-$pkgver"
	for x in bin libexec lib share deno.*; do
		test -e $x && mv $x "$srcdir/dist/"
	done
}

check() {
	true
}

package() {
	cd "$srcdir/dist"
	mkdir -p "$pkgdir/usr/local/bin"
	mkdir -p "$pkgdir/usr/share/brewkit"
	for x in bin libexec lib share deno.*; do
		test -e $x && cp -r $x "$pkgdir/usr/share/$pkgname/"
	done
	install -D "../..//bk.sh" "$pkgdir/usr/local/bin/bk"
}
