# Maintainer: taotieren <admin@taotieren.com>

pkgname=nping
_name=Nping
pkgver=0.6.1
pkgrel=1
pkgdesc="🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations"
arch=($CARCH)
url="https://github.com/hanshuaikang/Nping"
license=('MIT')
provides=(${pkgname} nbping)
conflicts=(${pkgname} nbping)
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
sha256sums=('48d46e11cec3c69e6c28e91fefbba47f4773aab1c9d8c1f15e276311f79c43ec')

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

    install -vDm755 target/release/nbping -t ${pkgdir}/usr/bin/
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
