# Maintainer: novica <nnovica@gmail.com>

pkgname=ir
pkgver=0.3.0 # renovate: datasource=github-tags depName=r-lib/ir
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

sha512sums=('707568f14e59bb6e93cbc1bf1b16313e32803c895e59c1949713caecde066e1e4438c61cb923b1b28b64833642f5359ad59af6f62bf8b12d931cd48d2e8fb560')
