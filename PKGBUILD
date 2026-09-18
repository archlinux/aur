pkgname=url-open
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI tool for opening URLs in the system browser"
arch=('x86_64')
url="https://github.com/unsubble/url-open"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/unsubble/url-open/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"

    go build \
        -trimpath \
        -ldflags "-X main.version=v$pkgver" \
        -o url-open \
        ./cmd/url-open
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 url-open "$pkgdir/usr/bin/url-open"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
