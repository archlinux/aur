# Maintainer: Konstantin Podsvirov <konstantin@podsvirov.pro>

pkgname=mdbook-pikchr
pkgver=0.1.5
pkgrel=1
pkgdesc='A mdbook preprocessor to render pikchr code blocks as images in your book'
arch=('x86_64')
url='https://github.com/podsvirov/mdbook-pikchr'
license=('MIT')
depends=('mdbook')
makedepends=('rust')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5b762d0b8774bddcfc61bd7485ae51d4985266882a02837782112981dc368a16')

prepare() {
  cd "${pkgname}-${pkgver}"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"

  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  # binary
  install -vDm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"

  # documentation
  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

  # license
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
