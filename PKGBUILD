# Maintainer: Gleb Buzin <qufiwefefwoyn@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=jql
pkgver=3.2.3
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/yamafaktory/jql/archive/v${pkgver}.tar.gz)
sha512sums=('09ee802da32374c0eb61cec20bb35d5b14ad08e1ee83be772a5d6aded23a122147ba81a2af39b5a432a0499e3734b8b1969e8ce36d45c541c4076c4860b14729')

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
