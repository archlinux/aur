# Maintainer: novica <nnovica@gmail.com>

pkgname=rd2qmd
pkgver=0.6.0 # renovate: datasource=github-tags depName=eitsupi/rd2qmd
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

sha512sums=('355693479b9b4a01e28892933e05b8531049031aa9c6f42a5e1c5a48592b66b5b14fd27794d3a35f7671781328bcc2c8e00cb3d79846029b4349e23fb0e44912')
