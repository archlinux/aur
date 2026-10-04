# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=cellscape
pkgver=0.1.0
pkgrel=2
pkgdesc="TUI simulator for eight classic cellular automata"
arch=('x86_64')
url="https://github.com/ashish0kumar/cellscape"
license=('MIT')
depends=()
makedepends=('go')
_tag="v0.1.0"
_srcdir="cellscape-0.1.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ashish0kumar/cellscape/tar.gz/refs/tags/$_tag")
sha256sums=('3b5b59b7bc4df4d995ba375fb26d37826f75aacd4e66a9912201fb8cdf94d174')

build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}

package() {
	cd "$_srcdir"
	install -Dm755 "cellscape" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
