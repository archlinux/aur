# Maintainer: novica <nnovica@gmail.com>

pkgname=r-ark
pkgver=0.1.252
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

sha512sums=('caf1c07c371f36a6e2b479d5263642bee2bd50c5b22d7facb0588bc31ac3616b98ac64a1919d82f0dda3dca35d3b03bdde667558e39585283d9e4b0ff4e9dbb4')
