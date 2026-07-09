# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>

_pkgname="flow"
pkgname="$_pkgname-bin"
pkgver=0.322.0
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
        '4865812410cff0f232a87be80e8b6cd632aaefbfd097e8c20bbfd7171ab0ee8ef7e094eb75b482c109e2be898775a7bea9e62a217d78596ca456dfaefb2b404c'
        '20291e21101540292f47589798cc1264fd5fc496b556ccdb1264381ff093a6be8677270fa7b3d342a42d78758b1f2d41fb4a759d3a590c41cefd0b375b8d8b70')
b2sums_x86_64=('b369f7b9ac91ff94326346b896be144989ccb19db6aff8659496a0f863db014f81798afe39caa890b5f2e82e67872e6d0acc39f7098b6aa9d8aa711aa00b9efa')
b2sums_aarch64=('0ec4441a6dfc707ac3361d8d11e0b19b5004413686e05ea8230a16ecb4bd1b51dd88b8ef3d95f95903a850d03ce0cacf111110fa0b729f2c8c0047035660dfc3')

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
