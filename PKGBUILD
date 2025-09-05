# Maintainer: Andy Malsbury <andymalsb@gmail.com>
pkgname=lxtui
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern terminal user interface for managing LXC/LXD containers with intuitive keyboard shortcuts"
arch=('x86_64')
url="https://github.com/FoleyBridge-Solutions/lxtui"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FoleyBridge-Solutions/lxtui/archive/v$pkgver.tar.gz")
sha256sums=('33c383538e3595e8a074995194111666ed4705a0d5828b41a38602aeb64e6d37')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 KEYBINDINGS.md "$pkgdir/usr/share/doc/$pkgname/KEYBINDINGS.md"
    install -Dm0644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
    install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}