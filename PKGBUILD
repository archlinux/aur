# Maintainer: novica <nnovica@gmail.com>

pkgname=r-air
pkgver=0.13.0 # renovate: datasource=github-releases depName=posit-dev/air
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

sha512sums=('9fc878afbf79e98feacaab6f5e0e7fb8669d31a85eff34ad0fda6b92755cc618f9431faecf901128ed32e893379fe1802b05ca959b15a45643a78503fa28b1ab')
