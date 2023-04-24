# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=helium-wallet
_pkgname=helium-wallet-rs
pkgdesc='Helium Wallet'
license=('Apache')
url='https://github.com/helium/helium-wallet-rs'
pkgver=1.7.12
pkgrel=1
arch=('x86_64')
depends=(
    'rust'
    'cargo'
    'openssl'
)
makedepends=(
    'cmake'
    'clang'
)
source=(
    "https://github.com/helium/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('e18c302ff99e13bcab0abcfcb436d19d3d993528798a64135efb1f70929ca72bee386c7377333368c607da7b42ce42cd15944f05083837d93bb178c0b7a50d1b')

build() {
    cd ${_pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd ${_pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
    cd ${_pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" bin/helium-wallet
}
