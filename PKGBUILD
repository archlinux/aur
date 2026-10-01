# Maintainer: novica <nnovica@gmail.com>

pkgname=ir
pkgver=0.4.1 # renovate: datasource=github-tags depName=r-lib/ir
pkgrel=1
pkgdesc="Run standalone R scripts from embedded dependency metadata"
url="https://github.com/r-lib/ir"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('ir-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/r-lib/ir/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/ir "${pkgdir}/usr/bin/ir"
  install -Dm755 target/release/rx "${pkgdir}/usr/bin/rx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('1ceea6f67f18f2caf9cffe7604e52fc55bf8498bdcec3786e2cad7b5265864a06987336aff6dea799c3305c45787c4b8c5505b2e90f72a03c9dfb2c2f5c51822')
