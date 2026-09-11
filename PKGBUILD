# Maintainer: novica <nnovica@gmail.com>

pkgname=typr
pkgver=0.5.11 # renovate: datasource=github-tags depName=we-data-ch/typr
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

sha512sums=('df93dd87e1d3d48389671a2a208bedf9661f9493b7fab99b088fdf7373deb1689de21b2df3544ae19719857abf51c792c2d1c9c0e6b6a5ecae0228693c8d11f0')
