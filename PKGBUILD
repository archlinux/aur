# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=helium-wallet
_pkgname=helium-wallet-rs
pkgdesc='Helium Wallet'
license=('Apache')
url='https://github.com/helium/helium-wallet-rs'
pkgver=1.6.8
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
sha512sums=('e20e615eb8143ad173b592265a80243543982d7df2490ca374264f987aaaa3ca1de85fa174c0b746a89d1348224da018c5b742aa2892bedf87e53ca97677f78c')

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
