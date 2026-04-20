# Maintainer: Linus Grolmes <linus@grolmes.de>
pkgname=dssh
pkgver=2.1.0
pkgrel=1
pkgdesc="The only SSH connection manager you'll ever need. TUI & CLI. ssh_config, SQLite or both."
arch=('x86_64' 'aarch64')
url="https://github.com/madLinux7/dssh"
license=('MIT')
makedepends=('go')
depends=('openssh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/madLinux7/dssh/archive/v$pkgver.tar.gz")
sha256sums=('d56f33b35982543b73931292f522439aab97e6d7b4adf6fe19c3f586f89a8a4f')

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
