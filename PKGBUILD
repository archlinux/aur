# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.niri-scratchpad-rs

pkgname=niri-scratchpad-rs
pkgver=2.1
pkgrel=1
pkgdesc="Dynamic & Static Scratchpad Management for Niri"
arch=('x86_64' 'aarch64')
url="https://github.com/argosnothing/niri-scratchpad-rs"
license=('GPL-3.0-or-later')
makedepends=('cargo')
provides=('niri-scratchpad')
conflicts=('niri-scratchpad' 'niri-scratchpad-rs-git')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/argosnothing/niri-scratchpad-rs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4169ceb063eed0d8047b00608fc76da0ba4255b67af62713456ccc5cc7501a9a')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/niri-scratchpad" "${pkgdir}/usr/bin/niri-scratchpad"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
