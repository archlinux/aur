# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air
pkgver=0.10.0
pkgrel=1
pkgdesc="An R language server and formatter"
url="https://github.com/posit-dev/air"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('r-air-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("air-${pkgver}.tar.gz::https://github.com/posit-dev/air/archive/${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/air-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/air-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/air-${pkgver}/target/release/air"  "${pkgdir}/usr/bin/r-air"
  install -Dm644 "${srcdir}/air-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('c34c1c5f8d00d8991091a1e5e959e5391d1d1f57ecd3cb038a6917618c4f9a72bb1b5b86c0c854e95f5d59e1f07322c0579fd0afe06582762a0bfcb5c63be2b4')
