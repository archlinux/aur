# Maintainer: Friendships666 <tianfs6x6@gmail.com>
pkgname=wq
pkgver=0.1.0
pkgrel=1
pkgdesc="Pure TUI plain-text editor built for Ghostty & Kitty protocols on Linux"
arch=('x86_64')
url="https://github.com/Friendships6666/wq"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Friendships6666/wq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb3105e5a6fe930d2dd39195b8758705a32235a9105f77c833de7cb084cd95d9')

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
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
