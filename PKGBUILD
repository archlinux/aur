# Maintainer: Alexandros McCray <runa-dev at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=runa
pkgver=0.3.8
pkgrel=1
pkgdesc="A fast and lightweight console file browser written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('16a65701409caf5a131412a0eabaf55b204261c13fdb3c1fbad90602aca532e0')

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
