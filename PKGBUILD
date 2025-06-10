# Maintainer: rahmed <rahmedyev@gmail.com>

pkgname=thinkfan-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight tool for controlling ThinkPad Laptop's Fan"
url="https://github.com/rahmedi/thinkfan-cli"
license=('GPL3')
makedepends=('cargo')
arch=('x86_64')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
