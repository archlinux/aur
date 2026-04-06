# Maintainer: novica <nnovica@gmail.com>

pkgname=r-ark
pkgver=0.1.249
pkgrel=1
pkgdesc="An R kernel"
url="https://github.com/r-lib/rig"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    gcc-libs
    libgcc
    glibc
)
conflicts=('r-ark-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("ark-${pkgver}.tar.gz::https://github.com/posit-dev/ark/archive/${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/ark-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/ark-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/ark-${pkgver}/target/release/ark"  "${pkgdir}/usr/bin/r-ark"
  install -Dm644 "${srcdir}/ark-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('125ee8d8dd46f3b2c1ed6b819452fddeb6d1292143d312b676887b9c58560b290d8aba111e06df4ca806739218e760ea822ba4df1b118934e50517f71e68a285')
