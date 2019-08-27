# Maintainer: Eric Förster <eric DOT foerster AT outlook DOT com>
# Maintainer: Patrick Förster <patrick DOT foerster AT outlook DOT de>

pkgname=texlab
pkgver=1.5.0
pkgrel=1
pkgdesc="A cross-platform implementation of the Language Server Protocol providing rich cross-editing support for the LaTeX typesetting system."
arch=('x86_64')
url="https://github.com/latex-lsp/texlab"
license=('MIT')
makedepends=('rustup' 'nodejs' 'npm')
depends=('gcc-libs')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/latex-lsp/texlab/archive/v${pkgver}.tar.gz")
sha512sums=('540e91c94bf7c8d7e8230232722e81a5bda6565aa4dfbbc413c23babab2d0310b9d371ada3b3a8ff28c597a8f5ad0f53f3dec5af069e115c4fbefc5964da601d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --all --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
