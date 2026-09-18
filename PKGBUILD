# Maintainer: novica <nnovica@gmail.com>

pkgname=raven
pkgver=0.21.1 # renovate: datasource=github-tags depName=jbearak/raven
pkgrel=1
pkgdesc="Static analyzer for R — a language server in your editor, a checker in CI"
url="https://github.com/jbearak/raven"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=(
    libgcc
    glibc
)
conflicts=('raven-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jbearak/raven/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked -p raven
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/raven"  "${pkgdir}/usr/bin/raven"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

sha512sums=('75f451c9637b61ec707b1f203c0f88ab7c482b00a679efbd7e67d3da1f8a2f4d7fee16f3427ccad45703bac143732e30a6ef52886a882ce3d155b6a8c633fbd6')
