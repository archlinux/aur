# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=clipy
pkgver=0.2.0
pkgrel=2
pkgdesc="Manage clipboard history"
arch=('x86_64')
url="https://github.com/szktkfm/clipy"
license=('MIT')
depends=()
makedepends=('go')
_tag="v0.2.0"
_srcdir="clipy-0.2.0"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/szktkfm/clipy/tar.gz/refs/tags/$_tag")
sha256sums=('2efe988a65463ac16545a2ee3a5ebdfbba80aabc68fa191c293744140870fadc')

build() {
	cd "$_srcdir"
	export CGO_ENABLED=0
	export GOFLAGS="-trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}

package() {
	cd "$_srcdir"
	install -Dm755 "clipy" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 assets/clipy-demo.gif "$pkgdir/usr/share/doc/$pkgname/clipy-demo.gif"
	install -d "$pkgdir/usr/share/$pkgname/shell"
	install -Dm644 shell/clipy.bash "$pkgdir/usr/share/$pkgname/shell/clipy.bash"
	install -Dm644 shell/clipy.zsh "$pkgdir/usr/share/$pkgname/shell/clipy.zsh"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
