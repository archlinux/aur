# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=helium-wallet
_pkgname=helium-wallet-rs
pkgdesc='Helium Wallet'
license=('Apache')
url='https://github.com/helium/helium-wallet-rs'
pkgver=1.6.6
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
sha512sums=('207a295fc44b49cc47677d4ddaa8e090beb55afebab5d08fd350cb641740fc6660e6faf79715356ef05a115dd4767c45dab6cc70ea9ab2b3d82d9b3dd248e6c0')

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
