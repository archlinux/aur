# Maintainer: taotieren <admin@taotieren.com>

pkgname=nping
_name=Nping
pkgver=0.2.4
pkgrel=5
pkgdesc="🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations"
arch=($CARCH)
url="https://github.com/hanshuaikang/Nping"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
# replaces=(${pkgname})
depends=(
    gcc-libs
    glibc
)
makedepends=(
    cargo
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e3d3578a5408ce734a8d62b397e4c7c6621dc599780bbe84f10bfc470da1ae4')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}/"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}/"
    cargo build --release
}

# check() {
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}/"

    install -Dvm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}-rs
}
