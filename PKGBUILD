# Maintainer: novica <nnovica@gmail.com>

pkgname=rd2qmd
pkgver=0.4.0 # renovate: datasource=github-tags depName=eitsupi/rd2qmd
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

sha512sums=('806e8e8e8d918f9fbd0b90b2ed470787158a8816cb5938724a71fb87f50da79d2a12e926448e7c00e2b77c5dfc72a9ea37efd00cde592c478dcaaa27a9da0444')
