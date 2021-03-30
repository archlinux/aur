# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=helium-wallet
_pkgname=helium-wallet-rs
pkgdesc='Helium Wallet'
license=('Apache')
url='https://github.com/helium/helium-wallet-rs'
pkgver=1.5.0
pkgrel=1
arch=('x86_64')
depends=(
    'rust'
    'cargo'
    'openssl'
)
source=(
    "https://github.com/helium/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('6c4b1ee5bba27270f05e4a12008f22f4d1e844de20e0632c07ac1fb68a382255be47862db20c4566a8ab5406527fa05dc3bf23a0ed818b3d208505673e768942')

build() {
    cd ${_pkgname}-${pkgver}

    # Test with rustup:
    # info: latest update on 2021-03-25, rust version 1.51.0 (2fd73fabe 2021-03-23)
    # `rustup update`
    cargo update
    cargo build --release
}

package() {
    cd ${_pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" bin/helium-wallet
}
