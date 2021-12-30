# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=3.0.0
pkgrel=1
pkgdesc="Command-line tool to set up hot-corners"
arch=(x86_64)
url="https://github.com/MichaelStraube/edges"
license=(MIT)
depends=(gcc-libs libxi libxrandr)
makedepends=(cargo)
source=("https://github.com/MichaelStraube/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('27462a539f578e9707f464ad41853b74cf743d15ddde36811955f802404f375ecf0e1620f2d310de82c1eb4898b5cb2962541181d59a627c91913435cad840c1')

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
