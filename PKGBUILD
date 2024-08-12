# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=svix-server
_pkgname=${pkgname}
pkgver=1.29.0
pkgrel=1
pkgdesc="Svix webhooks server"
arch=(x86_64)
url="https://www.svix.com"
license=('MIT')
makedepends=('cargo' 'git')
source=("${_pkgname}::git+https://github.com/svix/svix-webhooks.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
    cd "${_pkgname}/server"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${_pkgname}/server"
    cargo build --frozen --release --all-features
}

package() {
    cd "${_pkgname}/server"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
