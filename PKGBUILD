# Maintainer: mfw <espadonne@outlook.com>

pkgname=fackr
pkgver=0.9.4
pkgrel=1
pkgdesc='Terminal text editor written in Rust - facsimile reimplementation'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/TenseleyFlow/fackr'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TenseleyFlow/fackr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c40fe4fe24a75f85274346f47c5dadbd6d54500412092c1788b88e7eaa44473')

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
