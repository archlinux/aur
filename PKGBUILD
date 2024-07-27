# Maintainer: taotieren <admin@taotieren.com>

pkgname=crm
pkgver=0.2.1
pkgrel=8
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
sha256sums=('ae0dab817482e28451b3e9e0b73cc46226001117dc21362c718e21d40c3efcd2')

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
