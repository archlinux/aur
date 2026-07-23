# Maintainer: Linus Grolmes <linus@grolmes.de>
pkgname=dssh
pkgver=2.2.0
pkgrel=1
pkgdesc="The only SSH connection manager you'll ever need. CLI & TUI."
arch=('x86_64' 'aarch64')
url="https://github.com/madLinux7/dssh"
license=('MIT')
makedepends=('go')
depends=('openssh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/madLinux7/dssh/archive/v$pkgver.tar.gz")
sha256sums=('4f1975bdb226ddc05f8434503adcdb70ee1735a22e304712a717f2230146eba7')

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
