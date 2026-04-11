# Maintainer: Linus Grolmes <linus@grolmes.de>
pkgname=dssh
pkgver=2.0.2
pkgrel=3
pkgdesc="The only SSH connection manager you'll ever need. TUI & CLI. ssh_config, SQLite or both."
arch=('x86_64' 'aarch64')
url="https://github.com/madLinux7/dssh"
license=('MIT')
makedepends=('go')
depends=('openssh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/madLinux7/dssh/archive/v$pkgver.tar.gz")
sha256sums=('a6262ce90be99981016e8ca7c63225a9fec5d7297f7c1931d50b478339aff211')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build -ldflags="-s -w -X main.version=v$pkgver" -o dssh ./cmd/dssh/
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 dssh "$pkgdir/usr/bin/dssh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
