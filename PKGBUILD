# Maintainer: Linus Grolmes <linus@grolmes.de>
pkgname=dssh
pkgver=2.2.1
pkgrel=1
pkgdesc="The only SSH connection manager you'll ever need. CLI & TUI."
arch=('x86_64' 'aarch64')
url="https://github.com/madLinux7/dssh"
license=('MIT')
makedepends=('go')
depends=('openssh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/madLinux7/dssh/archive/v$pkgver.tar.gz")
sha256sums=('e80a6d4995266851ad12b50c2c10beccbbd564684c27f416ed843bf622748098')

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
