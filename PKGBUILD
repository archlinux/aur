# Maintainer: novica <nnovica@gmail.com>

pkgname=baler
pkgver=0.2.1 # renovate: datasource=github-releases depName=baler-dev/baler
pkgrel=1
pkgdesc="A Cargo-style package manager for {box} modules"
url="https://github.com/baler-dev/baler"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
    bzip2
    xz
)
conflicts=('baler-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/baler-dev/baler/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/baler-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/baler-${pkgver}"

  cargo build --release --locked -p baler-cli
}

package() {
  install -Dm755 "${srcdir}/baler-${pkgver}/target/release/baler"  "${pkgdir}/usr/bin/baler"
  install -Dm644 "${srcdir}/baler-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('370d29bf2857106e1731fffa8f4f2ea24a41b322475ef904c8811fc7444fa2a7')
