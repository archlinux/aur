# Maintainer: RoboSync Team <mcoelho@gmail.com>
pkgname=robosync
pkgver=1.0.6
pkgrel=1
pkgdesc="High-performance file synchronization with intelligent concurrent processing"
arch=('x86_64' 'aarch64')
url="https://github.com/roethlar/robosync"
license=('MIT')
depends=('zstd')
makedepends=('rust' 'cargo' 'pkg-config')
source=("https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('9a33a9ef7ddf815d69a31c947571d549f6adeaae38c48d19bba5f89951f4525b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_PROFILE_RELEASE_LTO=true
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export PKG_CONFIG_ALLOW_CROSS=1
    cargo build --release --locked --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
