# Maintainer: taotieren <admin@taotieren.com>

pkgname=nping
_name=Nping
pkgver=0.5.0
pkgrel=1
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
    rust
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0ba70f55fc126445b8c57be234c2eb355939336c731c8209b320bd89b85cac50')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}/"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
