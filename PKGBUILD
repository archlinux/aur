# Maintainer: novica <nnovica@gmail.com>

pkgname=okr
pkgver=0.1.11 # renovate: datasource=github-releases depName=nanxstats/okr
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

sha512sums=('42cbe59a68e688b1523dee8e30d874bf3fb2b8f64d01d53e8c143c322f0ea481ee3c70bc32d1b97830192bd3803131e59a42f8cf295c9c57464c2b4946ecb0fc')
