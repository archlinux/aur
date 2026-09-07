# Maintainer: novica <nnovica@gmail.com>

pkgname=typr
pkgver=0.5.9 # renovate: datasource=github-tags depName=we-data-ch/typr
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

sha512sums=('6f324740cc394f7dfb96899c85af29dc51e2d8958f04bc9c4b15f63e497e4cc75520fe984a3cc015fa648cfc36a74fb2895cb650d8dbae92620cbb4e1892ad83')
