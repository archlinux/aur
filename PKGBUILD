# Maintainer: novica <nnovica@gmail.com>

pkgname=r-ark
pkgver=0.1.228
pkgrel=1
pkgdesc="An R kernel"
url="https://github.com/r-lib/rig"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    gcc-libs
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

sha512sums=('37387c5a4ebc2d70424acdc3bac41f2bd3e989fbd84a17d94f5e86f81a632c93148844b37b73534de1eb85b570db563efe7253a7484c639e77ce4599419ee0e0')
