# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=gocost
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple, keyboard-driven TUI for tracking monthly expenses (Go + Bubble Tea)"
arch=('x86_64')
url="https://github.com/madalinpopa/gocost"
license=('MIT')
depends=()
makedepends=('go')
_tag="v1.5.0"
_srcdir="gocost-1.5.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/madalinpopa/gocost/tar.gz/refs/tags/$_tag")
sha256sums=('6092f748ba471dd0f40db2da0e20bd849ac5ba26d483a47d6a23495bc02db55b')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=1 GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/gocost
}
function package() {
	cd "$_srcdir"
	install -Dm755 "gocost" "$pkgdir/usr/bin/$pkgname"
	if [ -f ../LICENSE ]; then
		install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
