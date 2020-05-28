# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=jql
pkgver=2.6.1
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(https://github.com/yamafaktory/jql/archive/v${pkgver}.tar.gz)
sha512sums=('6ca627ed72d9a131f016d5914914436409b470857f8d0c6424a10831d059924f1a9f4c61841f9f7dd6eb395b39a770183b3feabac8210d5c503d8c15bf48bbe4')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 \
    "target/release/jql" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
