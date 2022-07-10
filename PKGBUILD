# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=3.0.1
pkgrel=1
pkgdesc="Command-line tool to set up hot-corners"
arch=(x86_64)
url="https://github.com/MichaelStraube/edges"
license=(MIT)
depends=(gcc-libs libxi libxrandr)
makedepends=(cargo)
source=("https://github.com/MichaelStraube/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b9463996923cb620a223fd033ae56ebfe338ecb2ee8c08e13bb8a5b73a77f0986372c731f3cca8eea4eafc855b4645a41cb9dfa623005019fa305de827cc014d')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/edges "$pkgdir/usr/bin/edges"
    install -Dm644 man/edges.1 "$pkgdir/usr/share/man/man1/edges.1"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
