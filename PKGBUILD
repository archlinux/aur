# Maintainer: user14923929
pkgname=ruster
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive TUI creator and editor for Cargo/Rust projects"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/ruster"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
provides=('ruster')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('660475c5fb6f5936ba8ac15453c261664ef0fa86488e2403ece9417db9be50da')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --workspace --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --workspace --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/ruster "$pkgdir/usr/bin/ruster"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
