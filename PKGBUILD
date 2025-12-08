# Maintainer: mfw <espadonne@outlook.com>

pkgname=fackr
pkgver=0.6.0
pkgrel=1
pkgdesc='Terminal text editor written in Rust - facsimile reimplementation'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/TenseleyFlow/fackr'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TenseleyFlow/fackr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('929d5349eeecb65ae2044711b7732819fbbac26fea588b6a7af8f77824823789')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked 2>/dev/null || cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    # Install main binary
    install -Dm755 "target/release/fackr" "$pkgdir/usr/bin/fackr"

    # Create symlink for fac command
    ln -s fackr "$pkgdir/usr/bin/fac"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
