# Maintainer: Your Name <your.email@example.com>
pkgname=todlog
pkgver=0.1.0
pkgrel=1
pkgdesc="A beautiful terminal-based task and log manager with markdown storage"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://codeberg.org/byt3sage/todlog"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/byt3sage/todlog/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Update this after first release

build() {
    cd "$pkgname"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags="-s -w -X main.version=$pkgver" -o "$pkgname" .
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
