# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>

_pkgname="flow"
pkgname="$_pkgname-bin"
pkgver=0.298.0
pkgrel=1
pkgdesc="A static type checker for JavaScript"

arch=('x86_64' 'aarch64')
url="https://$_pkgname.org"
license=('MIT')

provides=("$_pkgname")
depends=("glibc" "gcc-libs")
conflicts=("$_pkgname" "flow-control")

source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux64-v$pkgver.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/facebook/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64-v$pkgver.zip")
source=(
	"$pkgname-$pkgver-bash-completion::https://github.com/facebook/$_pkgname/raw/v$pkgver/resources/shell/bash-completion"
	"$pkgname-$pkgver-README.md::https://github.com/facebook/$_pkgname/raw/v$pkgver/README.md"
	"$pkgname-$pkgver-LICENSE::https://github.com/facebook/$_pkgname/raw/v$pkgver/LICENSE"
)
b2sums=('31a3133c70ea57e8fd8025add5701b9be627020d4f82655e7911853b33e3197eb53893fd119348112839d877a8d668aedfa15c7bb214de8f573b8453f69c4cc3'
        '599a1867da2f35ca5553271b6beec2fb878126a92655d52ff9ecb3580bed1dd7263fce2531f10f9f0505541a33fe19e57713a06e69471325ac67e925cfa7f0b1'
        '20291e21101540292f47589798cc1264fd5fc496b556ccdb1264381ff093a6be8677270fa7b3d342a42d78758b1f2d41fb4a759d3a590c41cefd0b375b8d8b70')
b2sums_x86_64=('0f04b5d2563102b10808f709749df60a8782d6033270ac1b704a3d0012d80b1716e4a846e83488274e6ec50baa7733f42393b05650895f6d31a8b83041f8e31d')
b2sums_aarch64=('063a6c5f6db87adbb7002f397277e877bef8cec8157b9cb13cdd165014a52cc354878a7f0804d9bdc11d20922ebfc7d8faddf75355351f5abf27f5301b379b18')

check() {
	_checkoutput="$("$srcdir/$_pkgname/$_pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "version $pkgver$"
}

package() {
	cd "$srcdir/"

	# Binary
	install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Misc files
	install -Dm644 "$pkgname-$pkgver-bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"

	install -Dm644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
