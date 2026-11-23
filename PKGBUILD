# Maintainer: novica <nnovica@gmail.com>

pkgname=tinyetl
pkgver=0.11.1 # renovate: datasource=github-releases depName=alrpal/TinyETL
pkgrel=1
pkgdesc="Fast, zero-config ETL in a single binary"
url="https://github.com/alrpal/TinyETL"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=(
    gcc-libs
    glibc
    openssl
    unixodbc)
conflicts=('tinyetl-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("tinyetl-${pkgver}.tar.gz::https://github.com/alrpal/TinyETL/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/TinyETL-${pkgver}"
    cargo fetch
}

build() {
  cd "${srcdir}/TinyETL-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/TinyETL-${pkgver}/target/release/tinyetl"  "${pkgdir}/usr/bin/tinyetl"
  install -Dm644 "${srcdir}/TinyETL-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('68d213dae88a1b0d3163536f3af8b6f195b243b47095f47416378462cc859132da01ba282e0d759dbde731b8f68cf6114924790deccdcec4e3e37776bf5e6d81')
