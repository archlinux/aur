# Maintainer: novica <nnovica@gmail.com>

pkgname=carrier-cli
pkgver=0.2.3 # renovate: datasource=github-tags depName=joshuamarie/carrier
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

sha512sums=('cc11c4c4d7ddd90f95cff2e1f949a7466693503cfd2f888ff07eb8f3cabec0bc5d0a4c3e8d2c5c20bc952b25a457feb3ae0338dacf2b99f2015ba52c0513d4e7')
