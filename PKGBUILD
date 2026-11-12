# Maintainer: novica <nnovica@gmail.com>

pkgname=okr
pkgver=0.1.12 # renovate: datasource=github-releases depName=nanxstats/okr
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

sha512sums=('75f8dd70f53c8804d5e5b2a2af8ecb883c448c97e58a2aab959b093bb43152331f9c782883b304c1d20df93a65c04ba1106661a60e0333e44ff456d0efca1cef')
