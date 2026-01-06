# Maintainer: Alexandros McCray <runa-dev at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=runa
pkgver=0.4.0
pkgrel=1
pkgdesc="A fast and lightweight console file browser written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b16df4168b39ba70cbb1cc22ca49e0a3b613470e826140f74f32f965ca2425df')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 docs/configuration.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
