# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=3.1.0
pkgrel=1
pkgdesc="Command-line tool to set up hot-corners"
arch=(x86_64)
url="https://github.com/MichaelStraube/edges"
license=(MIT)
depends=(gcc-libs glibc libx11 libxi libxrandr)
makedepends=(cargo)
source=("https://github.com/MichaelStraube/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('461fc3df48e428f64d3c2fc011f740e8904d364234f2f28a11b8019473e65bcc7f61ff5f70052365b1978a3c0a522d0c36b349af6ce3b4ab8710aaa0a8756da1')

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
