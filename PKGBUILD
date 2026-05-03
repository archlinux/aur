# Maintainer: novica <nnovica@gmail.com>

pkgname=r-rig
pkgver=0.8.0
pkgrel=1
pkgdesc="The R Installation Manager"
url="https://github.com/r-lib/rig"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    gcc-libs
    glibc
)
conflicts=('r-rig-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("rig-${pkgver}.tar.gz::https://github.com/r-lib/rig/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/rig-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/rig-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/rig-${pkgver}/target/release/rig"  "${pkgdir}/usr/bin/r-rig"
  install -Dm644 "${srcdir}/rig-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('044cdaa77ab7f50bb336737a983c57ff4c048a3b1649ef35cd664169ba9ee61629c3710bd77e6834d30956041980458a59eb97f0582d661d59783254e60c981c')
