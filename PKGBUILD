# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>
pkgname=helium-ledger-cli
pkgdesc='Helium Application for Ledger'
license=('Apache')
url='https://github.com/helium/helium-ledger-cli'
pkgver=2.2.3
pkgrel=1
arch=('x86_64')
makedepends=(
    'rust'
    'cargo'
    'systemd'
    'cmake'
    'clang'
)
source=("https://github.com/helium/helium-ledger-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cc86ed26fad34a46bc9ad67f36f77fdb1da91876c597de81801aaad12d5c9845e40bed6afa31ea2f94d01580ecdfc960306fce7c6c645a80dba9165e7e7c1485')

prepare() {
    cd ${pkgname}-${pkgver}
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

}

check() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" target/release/helium-ledger-cli
}
