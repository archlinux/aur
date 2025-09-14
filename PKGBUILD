# Maintainer: Josh Andrews <joshurtree@yahoo.com>
pkgname=hyprsession
pkgver=0.1.5
pkgrel=1
pkgdesc="A session manager for Hyprland"
url="https://github.com/joshurtree/hyprsession"
license=('GPL-3.0')
depends=('hyprland')
makedepends=('cargo')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
sha256sums=('b05e0bbf528eb2e9f6ad3c0c57dfe21d2f4c501516efb43b83257b861157581a')
