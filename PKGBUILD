# Maintainer: novica <nnovica@gmail.com>

pkgname=carrier-cli
pkgver=0.2.2 # renovate: datasource=github-tags depName=joshuamarie/carrier
pkgrel=1
pkgdesc="A module manager for {box} modules"
url="https://github.com/joshuamarie/carrier"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
    bzip2
    xz
)
conflicts=('carrier-cli-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joshuamarie/carrier/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/carrier-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/carrier-${pkgver}"

  cargo build --release --locked -p carrier-cli
}

package() {
  install -Dm755 "${srcdir}/carrier-${pkgver}/target/release/carrier"  "${pkgdir}/usr/bin/carrier-cli"
  install -Dm644 "${srcdir}/carrier-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('922f4c57fd0ec0f43aa0512716358ae6cf6a4aa95e55294c836cf2a0094ba28178dc3fdbfb1e05a4fe7c14f997e6193d77a69a4fc3936ccbfc7d6db5b9d4f184')
