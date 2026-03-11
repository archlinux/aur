# Maintainer: Limehawk <limehawk@users.noreply.github.com>
pkgname=lazyreno
pkgver=0.1.3
pkgrel=1
pkgdesc="TUI dashboard for self-hosted Renovate CE"
arch=('x86_64' 'aarch64')
url="https://github.com/limehawk/lazyreno"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/lazyreno/archive/v$pkgver.tar.gz")
sha256sums=('6cf72970e5e7700b78f7d5b0076f98e6672838d626ec9dd3dc6b0df88357024e')

build() {
    cd "$pkgname-$pkgver"
    CGO_ENABLED=0 go build -trimpath -ldflags="-s -w -X main.version=v$pkgver" -o "$pkgname" ./cmd/lazyreno
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
