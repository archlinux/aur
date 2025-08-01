# Maintainer: RoboSync Team <robosync@example.com>
pkgname=robosync
pkgver=1.0.3
pkgrel=1
pkgdesc="High-performance file synchronization with intelligent concurrent processing"
arch=('x86_64' 'aarch64')
url="https://github.com/roethlar/robosync"
license=('MIT')
depends=('zstd')
makedepends=('rust' 'cargo')
source=("https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('cf22f06c324cd0c0d340c0aa13b607adf26c79f6eaeccf57c9513d47dcaa97bc')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}