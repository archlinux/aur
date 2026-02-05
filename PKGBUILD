# Maintainer: novica <nnovica@gmail.com>

pkgname=r-rig
pkgver=0.7.1
pkgrel=1
pkgdesc="The R Installation Manager"
url="https://github.com/r-lib/rig"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    gcc-libs
    glibc
)
conflicts=('r-rig-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("rig-${pkgver}.tar.gz::https://github.com/r-lib/rig/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/rig-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/rig-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/rig-${pkgver}/target/release/rig"  "${pkgdir}/usr/bin/r-rig"
  install -Dm644 "${srcdir}/rig-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('b854341f0fda0d6d542250d0f196959b70b9204a5d62b9b9afb765006a06cfc694ef52af562e87342b393986b6ddb3c5f87e28e0639ae86b9af663c916a6993d')
