# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jack Roehr <jack@seatgull.com>
# Maintainer: tee <teeaur at duck dot com>

pkgname=ticker-bin
_pkg=ticker
pkgver=5.0.7
pkgrel=1
pkgdesc='Terminal stock ticker with live updates and position tracking'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/achannarasappa/ticker"
license=('GPL-3.0-only')
depends=('glibc')
provides=("$_pkg")
conflicts=("$_pkg")
options=(!strip)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-arm64.tar.gz")
source_armv6h=("$pkgname-$pkgver-armv6h.tar.gz::$url/releases/download/v$pkgver/$_pkg-$pkgver-linux-armv6.tar.gz")
sha256sums_x86_64=('60e0f8d366f9c0ed26ac5435ec4948f2a617cdd1efff3de3f3bc03e26cafab27')
sha256sums_armv6h=('11f6484dcd6b99d0bf8ea38bbbc716d94e836b753414ebeb7d47cb5c298577eb')
sha256sums_aarch64=('7ce237b20d4df83a87cb3a08446f10c9c5f08e434edad62daaaae006c46cd04b')

package () {
	install -Dv ticker -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./ticker completion bash > "${pkgdir}/usr/share/bash-completion/completions/ticker"

	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./ticker completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_ticker"

	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./ticker completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/ticker.fish"
}
# vim:set noet sts=0 sw=4 ts=4:
