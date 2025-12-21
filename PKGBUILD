# Maintainer: mfw <espadonne@outlook.com>

pkgname=fackr
pkgver=1.0.2
pkgrel=1
pkgdesc='Terminal text editor written in Rust - facsimile reimplementation'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/TenseleyFlow/fackr'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TenseleyFlow/fackr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4293f1b6239b2a4e9ccf9d80ddf440a36faebfa6edff310c7a7c8202ff759c5')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked 2>/dev/null || cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    # Install main binary
    install -Dm755 "target/release/fackr" "$pkgdir/usr/bin/fackr"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
