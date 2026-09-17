# Maintainer: novica <nnovica@gmail.com>

pkgname=raven
pkgver=0.21.0 # renovate: datasource=github-tags depName=jbearak/raven
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

sha512sums=('23de0cfa7cc7d260b826c6abd320593edaa5099a7e93e7bc0ab3086534c38320b483e2b990973e80e149d54aa0186c28ff7a434679a67990d6189125c4114f03')
