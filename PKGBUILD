# Maintainer: Your Name <vinayydv343@example.com>
pkgname=ghostty-rpc
pkgver=1.0.0
pkgrel=1
pkgdesc="Discord Rich Presence integration for Ghostty terminal"
arch=('x86_64')
url="https://github.com/vinayydv3695/ghostty-rpc"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinayydv3695/ghostty-rpc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Update with actual checksum after first download

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    if [ -f "assets/ghostty-rpc.service" ]; then
        install -Dm644 "assets/ghostty-rpc.service" \
            "$pkgdir/usr/lib/systemd/user/ghostty-rpc.service"
    fi
    
    if [ -f "README.md" ]; then
        install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
