# Maintainer: novica <nnovica@gmail.com>

pkgname=typr
pkgver=0.6.1 # renovate: datasource=github-tags depName=we-data-ch/typr
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

sha512sums=('30c14f46df6e135023a52f04650b1a74762cabc738e881077b4c7dcce5d88ba227d47c4f3a1bd8be544f6a124828f2ef16cee2ed08e79af36c592e787ad7a494')
