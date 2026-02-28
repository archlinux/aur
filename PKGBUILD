# Maintainer: novica <nnovica@gmail.com>

pkgname=r-ark
pkgver=0.1.233
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

sha512sums=('95e2d15689516b95976e4765bd367ed724ba279d19c34245f7bed443480cc809cfc8f29ba5ec5d97209b9cbe5008b653dae8d3d161b821f8d502da3f8d88882c')
