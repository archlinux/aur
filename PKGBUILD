# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>

_pkgname="flow"
pkgname="$_pkgname-bin"
pkgver=0.343.0
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
        '54c3c678ae1da11abaa4ee7584de7c8d0bd3cdce999117ee8f9ee83a25dd51df2c76563dbe8846993fdde135c8cc012db9615b81a6a3562e6817beb7e4692851'
        '20291e21101540292f47589798cc1264fd5fc496b556ccdb1264381ff093a6be8677270fa7b3d342a42d78758b1f2d41fb4a759d3a590c41cefd0b375b8d8b70')
b2sums_x86_64=('e475b5225397ec7d61d0e1469c67be524ab72276c0029ae35718f566bbc8e33bab6d4d0d2897ff5fae4ceff042bf139327d98f39651aeba39b158be610c33066')
b2sums_aarch64=('a8e43a24097ee810d3f04cbd0d642f50749a65a1ef7f90476b04f33ca0e6c5ffcd1b5bd60fe3e39e3420a42b7dcece2b0a8fe484f6385cf59d40a3e862db3061')

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
