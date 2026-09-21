# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=addrb
pkgver=0.6.0
pkgrel=1
pkgdesc="A lightweight CLI/TUI address book that supports CardDAV"
arch=('x86_64')
url="https://github.com/mrusme/addrb"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go')
_tag="v0.6.0"
_srcdir="addrb-0.6.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/mrusme/addrb/tar.gz/refs/tags/$_tag")
sha256sums=('98a1b1a235738bf13f792d7768fda4606abc11b574beb5fa2f0c956d6439c5f9')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "addrb" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
