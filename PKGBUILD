# Maintainer: taotieren <admin@taotieren.com>

pkgname=crm
pkgver=0.2.0
pkgrel=0
pkgdesc="crm (Cargo registry manager)"
arch=('any')
url="https://github.com/wtklbm/crm"
license=('MIT' 'Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=('cargo')
makedepends=('rust')
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f86492f0798293795b5febf8d367b29bbbd939b1542e1b139470b90cddc7ed4')

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
