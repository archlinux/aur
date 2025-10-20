# Maintainer: Vinay <vinayydv343@gmail.com>
pkgname=ghostty-rpc
pkgver=1.0.0
pkgrel=1
pkgdesc="Discord Rich Presence integration for the Ghostty terminal"
arch=('x86_64')
url="https://github.com/vinayydv3695/ghostty-rpc"
license=('MIT')
depends=('rust' 'cargo' 'systemd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vinayydv3695/ghostty-rpc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/ghostty-rpc "$pkgdir/usr/bin/ghostty-rpc"
    install -Dm644 assets/ghostty-rpc.service "$pkgdir/usr/lib/systemd/user/ghostty-rpc.service"
    install -Dm644 assets/config.toml.example "$pkgdir/usr/share/ghostty-rpc/config.toml.example"
}

