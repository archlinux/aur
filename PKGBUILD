# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air
pkgver=0.9.0
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

sha512sums=('dd9da6b1e3afc907380e7df95fe2873571adb155f13821c9b64ba2bd6742a595c14a3eaea3b8204ce88baa33790445cfad28ca1bb5e2abaddaf62ab4f35b7842')
