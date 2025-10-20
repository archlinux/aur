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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    
    # Build with cargo
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$pkgname-$pkgver"
    
    # Run tests
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install systemd user service
    install -Dm644 "assets/ghostty-rpc.service" \
        "$pkgdir/usr/lib/systemd/user/ghostty-rpc.service"
    
    # Install example config
    install -Dm644 "assets/config.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install README
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
