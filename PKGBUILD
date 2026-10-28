# Maintainer: novica <nnovica@gmail.com>

pkgname=r-rig
pkgver=0.11.1 # renovate: datasource=github-releases depName=r-lib/rig
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

sha512sums=('3037e85b06fd3064b60246edb8624b26bc485d52fa5fd6dd95b5aa1ff3a8722295b6fd1c0a5a87c4984948bc40f16a440747b6136e9e9f0c4b2596b379fce4e9')
