# Maintainer: novica <nnovica@gmail.com>

pkgname=r-rig
pkgver=0.11.0 # renovate: datasource=github-tags depName=r-lib/rig
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

sha512sums=('4294c4e306c64bb37d44fc96d4e536cb9d594bb1960b77a313fdde4a41cb9a9c7f3606ca8a5308145c551d6d917007ae6649f5b57152e644a60e704cfe214e4e')
