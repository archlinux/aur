# Maintainer: Alec Mev <alec@mev.earth>

_commit=dec68f52a841549a71237967f14c93bd8a68b8f0
pkgname=proximity-sort
pkgver=1.0.4
pkgrel=1
pkgdesc='Simple command-line utility for sorting inputs by proximity to a path argument '
arch=('x86_64')
url=https://github.com/jonhoo/proximity-sort
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jonhoo/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('1c101cb6b8f60c2e8b2f0839bd3f0437dc0cc28333424bcfe21d37389261aa30')

build() {
  cd "${pkgname}-${_commit}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${_commit}"
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/proximity-sort
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-APACHE
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}
