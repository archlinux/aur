# Maintainer: novica <nnovica@gmail.com>

pkgname=tinyetl
pkgver=0.12.0 # renovate: datasource=github-releases depName=alrpal/TinyETL
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

sha512sums=('c3fcb9b29c56b6eb9cfb4613360d06f46aee29c69f14cbeae89f6ba429591222ff19fcda1edf883d886b56993891f1a062508f33ec0c4abc78f702e0094d924b')
