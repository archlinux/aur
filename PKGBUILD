# Maintainer: Vijay Papanaboina <https://github.com/Vijay-papanaboina>

pkgname=wifi-manager-git
pkgver=1
pkgrel=1
pkgdesc="A lightweight WiFi manager for Wayland compositors"
arch=('x86_64')
url="https://github.com/Vijay-papanaboina/wifi-manager"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'networkmanager')
makedepends=('rust' 'cargo' 'git')
provides=('wifi-manager')
conflicts=('wifi-manager')
source=("git+https://github.com/Vijay-papanaboina/wifi-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wifi-manager"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/wifi-manager"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked --all-features
}

check() {
    cd "$srcdir/wifi-manager"
    cargo test --release --locked
}

package() {
    cd "$srcdir/wifi-manager"
    
    # Install binary
    install -Dm755 "target/release/wifi-manager" "$pkgdir/usr/bin/wifi-manager"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
