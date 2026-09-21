# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=nocjk
pkgver=1.0.2
pkgrel=1
pkgdesc="Detect CJK (Chinese, Japanese, Korean) text: CLI tool and library"
arch=('x86_64')
url="https://github.com/aethiopicuschan/nocjk"
license=('MIT')
depends=()
makedepends=('go')
_tag="v1.0.2"
_srcdir="nocjk-1.0.2"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/aethiopicuschan/nocjk/tar.gz/refs/tags/$_tag")
sha256sums=('0ea7a4c5e8314c6940483717a6f6033afe1e73fe8bad7144d43b8b1c99921477')
function build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/nocjk
}
function package() {
	cd "$_srcdir"
	install -Dm755 "nocjk" "$pkgdir/usr/bin/$pkgname"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
