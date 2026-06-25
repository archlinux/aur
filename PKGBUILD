# Maintainer: novica <nnovica@gmail.com>

pkgname=r-rig
pkgver=0.8.1 # renovate: datasource=github-tags depName=r-lib/rig
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

sha512sums=('dd72a26854e26d370b64c366832de5e9e4d82404962def8e0615e5137a0debb7075e2a2b2ee68b463b16fd9e65984bf368dbc1cb33e5cd43c0581824ee9a22bb')
