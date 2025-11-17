# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=5.1.0
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("$_pkg")
conflicts=("$_pkg")
options=(!strip)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-arm64.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
sha256sums_x86_64=('1bf692a7c9cd1a9780ec7b9328ae985b78899bcc6dbca3583a050a3b8bc2c731')
sha256sums_armv6h=('b4087f22ab6265e3dbca163dd4415f94c08ec378181aab12ff18c3161e88f9c1')
sha256sums_aarch64=('2f107de6a98904f8f03df8ba308d11b4e202b913a69c514ea43d6d6d1ed69957')

package () {
	install -Dv ticker -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	mkdir -p "$pkgdir/usr/share/bash-completion/completions"
	./ticker completion bash > "$pkgdir/usr/share/bash-completion/completions/ticker"

	mkdir -p "$pkgdir/usr/share/zsh/site-functions"
	./ticker completion zsh > "$pkgdir/usr/share/zsh/site-functions/_ticker"

	mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
	./ticker completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/ticker.fish"
}
# vim:set noet sts=0 sw=4 ts=4:
