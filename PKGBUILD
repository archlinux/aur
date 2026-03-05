# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Jordan Klassen <forivall@gmail.com>

_pkgname="flow"
pkgname="$_pkgname-bin"
pkgver=0.304.0
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
b2sums_x86_64=('2ee91f2a10d9a60d0f4737d6b72dd3b5ea895522962b662f9d13d113e1e23b8e64e10b990409e9499e6a7fc0d9ef6fd5552154058e5f50b313b564f70bd707ea')
b2sums_aarch64=('67ad49f60eb9411ad5644ecce42dfd7fb086a0e569e280028594477ec3154cd9d402d93df36ab94caee93b6f5d52b81e201704076b59e0c6d801552dec78fffa')

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
