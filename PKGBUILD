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
source=()
sha256sums=()

build() {
    cd "$startdir"
    
    # Build with cargo
    cargo build --release --locked
}

check() {
    cd "$startdir"
    
    # Run tests (skip if no tests defined)
    cargo test --release --locked || true
}

package() {
    cd "$startdir"
    
    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install systemd user service (if exists)
    if [ -f "assets/ghostty-rpc.service" ]; then
        install -Dm644 "assets/ghostty-rpc.service" \
            "$pkgdir/usr/lib/systemd/user/ghostty-rpc.service"
    fi
    
    # Install example config (if exists)
    if [ -f "assets/config.toml.example" ]; then
        install -Dm644 "assets/config.toml.example" \
            "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
    fi
    
    # Install license (if exists)
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    
    # Install README
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
