# Maintainer: novica <nnovica@gmail.com>

pkgname=okr
pkgver=0.1.13 # renovate: datasource=github-releases depName=nanxstats/okr
pkgrel=1
pkgdesc="Reproducible R source context for coding agents"
url="https://github.com/nanxstats/okr"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('okr-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nanxstats/okr/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/okr"  "${pkgdir}/usr/bin/okr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('245a4fc6eb9ef68bacec288817e301c3e92eaf0751aa502031fdee1ac2164ef8f01e65b76dee0c598509f7e700ad827b4f55f78b542a6265f88b2f53517e7f8c')
