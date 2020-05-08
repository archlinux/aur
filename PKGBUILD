# Maintainer: Alec Mev <alec@mev.earth>

pkgname=proximity-sort
pkgver=1.0.6
pkgrel=1
pkgdesc='Simple command-line utility for sorting inputs by proximity to a path argument '
arch=('x86_64')
url=https://github.com/jonhoo/proximity-sort
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('f27abbad83745466bdc78cf4b0c2bc3f7428cd61b06878178c2ebfff7aa7e20e')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/proximity-sort
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-APACHE
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}
