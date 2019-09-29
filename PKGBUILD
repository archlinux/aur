# Maintainer: Eric Förster <eric DOT foerster AT outlook DOT com>
# Maintainer: Patrick Förster <patrick DOT foerster AT outlook DOT de>

pkgname=texlab
pkgver=1.6.0
pkgrel=1
pkgdesc="A cross-platform implementation of the Language Server Protocol providing rich cross-editing support for the LaTeX typesetting system."
arch=('x86_64')
url="https://github.com/latex-lsp/texlab"
license=('MIT')
makedepends=('rustup' 'nodejs' 'npm')
depends=('gcc-libs')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/latex-lsp/texlab/archive/v${pkgver}.tar.gz")
sha512sums=('bd524250b4723d97003d144ccfb88fed03daaf6bf24c2e660beb833f0a0661daba6dbe695892bf96bd34b3d945e7e6bbe23bd7a09c003be0651612912c07d1eb')

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
