# Maintainer: novica <nnovica@gmail.com>

pkgname=uvr
pkgver=0.4.2 # renovate: datasource=github-tags depName=nbafrank/uvr
pkgrel=1
pkgdesc="An extremely fast R package and project manager"
url="https://github.com/nbafrank/uvr"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
    bzip2
    xz
)
conflicts=('uvr-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nbafrank/uvr/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/uvr"  "${pkgdir}/usr/bin/uvr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('b4c580e77e816a959ae48dfe430e566be11f24cd3c7941a9f762cd2a90dac819a71b33dbea8d094816c996c295919b4c5ca0ef138da32c889fdb1f44d24a6381')
