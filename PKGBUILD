# Maintainer: novica <nnovica@gmail.com>

pkgname=typr
pkgver=0.5.12 # renovate: datasource=github-tags depName=we-data-ch/typr
pkgrel=1
pkgdesc="A modern type system for R"
url=https://github.com/we-data-ch/typr
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=(
    libgcc
    glibc
)
conflicts=('typr-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("typr-${pkgver}.tar.gz::https://github.com/we-data-ch/typr/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/typr-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/typr-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/typr-${pkgver}/target/release/typr"  "${pkgdir}/usr/bin/typr"
  install -Dm644 "${srcdir}/typr-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('be7a2f7efd11bf95cf003667139dab2c1a4b322df803c1a06abb65d138c3907d5f3a5d19b4dc37fa74efdccead5a02d11692cbc78ea83806e00f1d6eb8bf5342')
