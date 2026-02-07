# Maintainer: novica <nnovica@gmail.com>

pkgname=tinyetl
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast, zero-config ETL in a single binary"
url="https://github.com/alrpal/TinyETL"
arch=('x86_64' 'aarch64')
license=('MIT')
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

sha512sums=('d566a6e7714db4a0f0c3170140f8eb5adb7d1cbf330efb8225e359f6c1899fc745ac0398b6c884d1ab56c6605b517ba6e9c22d1496d6585cc664c92e94cd9faf')
