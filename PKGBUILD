# Maintainer: Linus Grolmes <linus@grolmes.de>
pkgname=dssh
pkgver=2.0.2
pkgrel=2
pkgdesc="The only SSH connection manager you'll ever need. TUI & CLI. ssh_config, SQLite or both."
arch=('x86_64' 'aarch64')
url="https://github.com/madLinux7/dssh"
license=('MIT')
makedepends=('go')
depends=('openssh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/madLinux7/dssh/archive/v$pkgver.tar.gz")
sha256sums=('6740535648bc041fd4e4ffcfff82228da1bb1fcc0dc6eeef0992e6f534d6c111')

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
