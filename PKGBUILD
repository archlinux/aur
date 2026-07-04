# Maintainer: novica <nnovica@gmail.com>

pkgname=rd2qmd
pkgver=0.3.0 # renovate: datasource=github-tags depName=eitsupi/rd2qmd
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

sha512sums=('2518f14744474c7ca9063890834b3f2ce227db74b441d4e24baccf434130323747fb295b618cca130d8e6827ecd720cdc0ec5d652376bd6e4df509d32501416c')
