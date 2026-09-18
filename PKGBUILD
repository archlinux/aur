# Maintainer: novica <nnovica@gmail.com>

pkgname=carrier-cli
pkgver=0.2.4 # renovate: datasource=github-tags depName=joshuamarie/carrier
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

sha512sums=('0aa2dd45a82402505dfcae201ab539855dacc01f007ade85afb4ed419639596514f9d04c30da2d7144b88a84a8e1b63b0e38030d597caf0c828eae3b54da5def')
