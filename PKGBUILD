# Maintainer: novica <nnovica@gmail.com>

pkgname=rd2qmd
pkgver=0.5.0 # renovate: datasource=github-tags depName=eitsupi/rd2qmd
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

sha512sums=('21a632201f92b1b4290fd4f08bdcee118097293fe373d46d86e20ed939c3b2b5b36df3caf26307cda60a78bc70ef66a5d629bebbf1f114cd656af249dab4e3f4')
