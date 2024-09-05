# Maintainer: taotieren <admin@taotieren.com>

pkgname=crm
pkgver=0.2.2
pkgrel=1
pkgdesc="crm (Cargo registry manager)"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/wtklbm/crm"
license=('MIT' 'Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(gcc-libs
    glibc)
makedepends=(cargo)
backup=()
options=('!lto')
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('77cae6fd157d8e9dac38b2dbee4dd9c438d24cc2a0e6f8943c7ac1c287301118')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
