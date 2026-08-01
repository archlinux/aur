# Maintainer: novica <nnovica@gmail.com>

pkgname=rd2qmd
pkgver=0.5.1 # renovate: datasource=github-tags depName=eitsupi/rd2qmd
pkgrel=1
pkgdesc="A fast Rd-to-Quarto Markdown converter with intelligent link resolution."
url="https://github.com/eitsupi/rd2qmd"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('rd2qmd-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("rd2qmd-${pkgver}.tar.gz::https://github.com/eitsupi/rd2qmd/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/rd2qmd-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/rd2qmd-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/rd2qmd-${pkgver}/target/release/rd2qmd"  "${pkgdir}/usr/bin/rd2qmd"
  install -Dm644 "${srcdir}/rd2qmd-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('09390270aad51a7a5761ac11e57f500bc34680b043fb21f345d185682b1cbf1c97b6d7819d5eb2c01d1b734d5d568509fafcbb862652da0d923ca0d73862b320')
