# Maintainer: Josh Andrews <joshurtree@yahoo.com>
pkgname=hyprsession
pkgver=0.1.4
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
sha256sums=('15b1020cf00bff62295180d2111668b816709a97e121be830c1c4358c766eb6b')
