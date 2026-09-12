# Maintainer: novica <nnovica@gmail.com>

pkgname=okr
pkgver=0.1.9 # renovate: datasource=github-tags depName=nanxstats/okr
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

sha512sums=('afea569795f9d3bea3653596bea69de359152f12298bdf2d46700efd7cdb9be259ea38948739e6a14a44ebed28c5e99551d6ff3306938dcfc9aef3b65f58839c')
