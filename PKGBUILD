# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=ccusage-statusline-rs
pkgver=1.17.0
pkgrel=1
pkgdesc="Fast statusline for Claude Code w/usage tracking, billing blocks, burn rate monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/ccusage-statusline-rs"
license=('MIT')
depends=()
makedepends=('cargo')
options=('!lto')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')
source=("https://github.com/ticpu/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "https://github.com/ticpu/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc")
sha256sums=('4a4f0326654ff005ffeda15bd44bc1f3b03a5001c0ab9a2751e3712ea63a81e0'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release -- --skip test_performance
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
