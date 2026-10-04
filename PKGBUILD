# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=sptui
pkgver=0.1.4
pkgrel=2
pkgdesc="Spotify TUI player, written in Go"
arch=('x86_64')
url="https://github.com/szktkfm/sptui"
license=('MIT')
depends=()
makedepends=('go')
_tag="v0.1.4"
_srcdir="sptui-0.1.4"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/szktkfm/sptui/tar.gz/refs/tags/$_tag")
sha256sums=('5be7dd66e64ee10cd6909f14e5366b0bbc0dba1033cf718d9d603b02ca87b771')

build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}

package() {
	cd "$_srcdir"
	install -Dm755 "sptui" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 assets/demo.gif "$pkgdir/usr/share/doc/$pkgname/demo.gif"
	install -Dm644 assets/sptui.tape "$pkgdir/usr/share/doc/$pkgname/sptui.tape"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
