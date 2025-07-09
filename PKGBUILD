# Maintainer: David Birks <david@birks.dev>

pkgname=somo
pkgver=1.1.0
pkgrel=1
pkgdesc='A human-friendly alternative to netstat for socket and port monitoring'
url='https://github.com/theopfr/somo'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("https://github.com/theopfr/somo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8026a39058a0e71cc603cd887b4fd5c0eb8ff310fb5ee1a36ff98ebe90be5878')
options=('!debug')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}
