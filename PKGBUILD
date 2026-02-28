# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air
pkgver=0.8.2
pkgrel=1
pkgdesc="An R language server and formatter"
url="https://github.com/r-lib/rig"
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

sha512sums=('3c578924cee3baf2c0b0d61eac5ecf08f0940adbedb347a107f7cb758ed1ecaf8ea5e662f0a9715a5898672bc3e1d0e537824f701c6248cbe3351e30a439c597')
