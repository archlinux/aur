# Maintainer: novica <nnovica@gmail.com>

pkgname=tinyetl
pkgver=0.11.0 # renovate: datasource=github-releases depName=alrpal/TinyETL
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

sha512sums=('814f58888a787cadaa7f0a8360fa3ebecb11d92eb0ad9f202a085add5e1dbdc14f807b83d18c1907dbb4c2514d28c1aa279555ff7b3c9c10822c59fedb8ade69')
