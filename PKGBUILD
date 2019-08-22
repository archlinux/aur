# Maintainer: Eric Förster <eric DOT foerster AT outlook DOT com>
# Maintainer: Patrick Förster <patrick DOT foerster AT outlook DOT de>

pkgname=texlab
pkgver=1.4.1
pkgrel=1
pkgdesc="A cross-platform implementation of the Language Server Protocol providing rich cross-editing support for the LaTeX typesetting system."
arch=('x86_64')
url="https://github.com/latex-lsp/texlab"
license=('MIT')
makedepends=('rustup' 'nodejs' 'npm')
depends=('gcc-libs')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/latex-lsp/texlab/archive/v${pkgver}.tar.gz")
sha512sums=('f970596e1b5be6c4e001a3fd85e214fb60356dbb92af012084453189aeca12c7b6ce90313da6c9f772ef0e7212f595c0ad424e985f8e43e4d112d756987ac166')

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
