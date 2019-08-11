# Maintainer: Eric Förster <eric DOT foerster AT outlook DOT com>
# Maintainer: Patrick Förster <patrick DOT foerster AT outlook DOT de>

pkgname=texlab
pkgver=1.3.0
pkgrel=1
pkgdesc="A cross-platform implementation of the Language Server Protocol providing rich cross-editing support for the LaTeX typesetting system."
arch=('x86_64')
url="https://github.com/latex-lsp/texlab"
license=('MIT')
makedepends=('rustup' 'python' 'nodejs' 'npm')
depends=('gcc-libs')
optdepends=('nodejs: citation rendering support')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/latex-lsp/texlab/archive/v${pkgver}.tar.gz")
sha512sums=('98f588e7807350e5ba7a3fb5e55b374693bc27b9e9512be50122682fce5f7eb5f284ce870b81d6693139bbb92dee7c377e2d184b64f72e822cec3cae7dee9603')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py
}

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
