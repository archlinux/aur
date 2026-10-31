# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=whyd
pkgver=0.2.0
pkgrel=1
pkgdesc="Diagnose why your Linux system froze, crashed or shut down"
arch=('x86_64')
url="https://github.com/vmaltarello/whyd"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmaltarello/whyd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95b05bc7895f626473b9807c4e39ba789bec9a36b649b7a4981615875816cfb1')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -buildmode=pie -ldflags "-buildid= -X main.version=$pkgver" -o build/whyd ./cmd/whyd
}

check() {
	cd "$pkgname-$pkgver"
	go test ./internal/...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/whyd "$pkgdir/usr/bin/whyd"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
