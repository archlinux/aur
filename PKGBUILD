# Maintainer: Your Name <dubkovmacsim@yandex.ru>
pkgname=pigfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="Fetch with ... PIGS!"
arch=('x86_64')
url="https://github.com/Justiks1337/pigfetch"
license=('MIT')
depends=('openssl' 'gcc-libs')  # Add any dependencies your project needs

# Source code and checksums
source=("git+https://github.com/Justiks1337/pigfetch.git")
sha256sums=('SKIP')  # Replace with actual SHA256 checksum

build() {
    cd "$srcdir/pigfetch"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$srcdir/pigfetch"
    cargo test --locked --all-features
}

package() {
    cd "$srcdir/pigfetch"

    # Install binary
    install -Dm755 "target/release/pigfetch" "$pkgdir/usr/bin/pigfetch"
    install -Dm644 arts.txt "${pkgdir}/usr/bin/arts.txt"

    # Install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install README or other documentation if available
    if [ -f "README.md" ]; then
        install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
