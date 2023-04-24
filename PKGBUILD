# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=helium-wallet
_pkgname=helium-wallet-rs
pkgdesc='Helium Wallet'
license=('Apache')
url='https://github.com/helium/helium-wallet-rs'
pkgver=2.1.1
pkgrel=1
arch=('x86_64')
depends=(
    'rust'
    'cargo'
)
makedepends=(
    'protobuf'
)
source=(
    "https://github.com/helium/${_pkgname}/archive/refs/tags/${pkgname}-v${pkgver}.tar.gz"
)
sha512sums=('9bc98abe1e760c38b00856c000f8be8a0d693a35cafd3b914fef7a455e0fc32f42f03d0253e933bf13253d1890c937e10d30075d8f30e4b0c7d1500b936fdf9c')

build() {
    cd ${_pkgname}-${pkgname}-v${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd ${_pkgname}-${pkgname}-v${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
    cd ${_pkgname}-${pkgname}-v${pkgver}
    install -Dt "$pkgdir/usr/bin/" bin/helium-wallet
}
