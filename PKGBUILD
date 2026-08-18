# Maintainer: novica <nnovica@gmail.com>

pkgname=arity
pkgver=0.19.1 # renovate: datasource=github-tags depName=jolars/arity
pkgrel=1
pkgdesc="Language server, formatter, and linter for R"
url="https://github.com/jolars/arity"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('arity-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("arity-${pkgver}.tar.gz::https://github.com/jolars/arity/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/arity-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/arity-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/arity-${pkgver}/target/release/arity"  "${pkgdir}/usr/bin/arity"
  install -Dm644 "${srcdir}/arity-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('f8a8f5589414f1b6284e88403e00d4868ea0d367bc04cbe117b04992c72aa8cd1264688b75cc1ea74b818edceaaedfda4cf0692bf9ad906f3755584d9e92a028')
