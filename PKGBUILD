# Maintainer: Eric Förster <eric DOT foerster AT outlook DOT com>
# Maintainer: Patrick Förster <patrick DOT foerster AT outlook DOT de>

pkgname=texlab
pkgver=1.4.0
pkgrel=1
pkgdesc="A cross-platform implementation of the Language Server Protocol providing rich cross-editing support for the LaTeX typesetting system."
arch=('x86_64')
url="https://github.com/latex-lsp/texlab"
license=('MIT')
makedepends=('rustup' 'nodejs' 'npm')
depends=('gcc-libs')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/latex-lsp/texlab/archive/v${pkgver}.tar.gz")
sha512sums=('d3d845d0f2106e49b6a323c1304343a8bed4b44007d7b931f7383b01d5c9a839a21baa991f2be6ca118041d1833de46514d2e1f3e647f5d171dbc7301a9aa176')

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
