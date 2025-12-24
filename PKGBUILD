# Maintainer: Your Name <your.email@example.com>
pkgname=sdtop
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal-based systemd service manager with process tree visualization"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/YashSaini99/sdtop"
license=('MIT')
depends=('systemd')
makedepends=('go>=1.21')
source=("$pkgname-$pkgver.tar.gz::https://github.com/YashSaini99/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o $pkgname ./cmd/main.go
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
