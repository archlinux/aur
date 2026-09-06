# Maintainer: novica <nnovica@gmail.com>

pkgname=typr
pkgver=0.5.8 # renovate: datasource=github-tags depName=we-data-ch/typr
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

sha512sums=('ca87f19a050f1ea15d226e99e3cf8a1dfd93425a20fe9519d9b92530e73684b43a3afbed8dced4166f7e294db04bc9c61adb129c2989572ef7d7c13705fc9fc3')
