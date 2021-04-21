# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=helium-wallet
_pkgname=helium-wallet-rs
pkgdesc='Helium Wallet'
license=('Apache')
url='https://github.com/helium/helium-wallet-rs'
pkgver=1.5.2
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
sha512sums=('1897a335aac68c5488e23c786eed5849f22f0293d117cc3cadb6b4de49d782452bec72fcd3f7e1a71355329bff61f2157bb22a1f877faf8fcdea43850ac2420c')

build() {
    cd ${_pkgname}-${pkgver}

    # Test with rustup:
    # info: latest update on 2021-03-25, rust version 1.51.0 (2fd73fabe 2021-03-23)
    # `rustup update`
    cargo update --workspace
    cargo build --release
}

package() {
    cd ${_pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" bin/helium-wallet
}
