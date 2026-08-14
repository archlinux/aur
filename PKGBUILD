# Maintainer: SathyaG
pkgname=lm-get
pkgver=0.9.1
pkgrel=1
pkgdesc="Search and download GGUF models from Hugging Face"
arch=('x86_64')
url="https://github.com/GSathyaPrakash/lm-get"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	go build -trimpath -ldflags="-s -w -X main.version=$pkgver" -o "$pkgname" ./cmd/lm-get
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
