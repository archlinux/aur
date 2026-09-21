# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=caldr
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight CLI/TUI calendar that supports CalDAV"
arch=('x86_64')
url="https://github.com/mrusme/caldr"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go')
_tag="v0.2.0"
_srcdir="caldr-0.2.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/mrusme/caldr/tar.gz/refs/tags/$_tag")
sha256sums=('ed5469db7d70330c78f847821009d0ec646dfa973ab6c3354eb5c948ed5ba01b')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}
function package() {
	cd "$_srcdir"
	install -Dm755 "caldr" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
