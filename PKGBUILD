# Maintainer: Michael Straube <michael.straubej@gmail.com>

pkgname=edges
pkgver=3.0.2
pkgrel=1
pkgdesc="Command-line tool to set up hot-corners"
arch=(x86_64)
url="https://github.com/MichaelStraube/edges"
license=(MIT)
depends=(gcc-libs glibc libx11 libxi libxrandr)
makedepends=(cargo)
source=("https://github.com/MichaelStraube/edges/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9df732483e89dde964dbcf8eaf092c927ac79f38152510799e0458b751f812e3d20e4336683d634fea30ddcb8596671f38a7fdb195cea9b14fdbaa45c99578eb')

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
