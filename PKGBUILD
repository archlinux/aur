# Maintainer: Gleb Buzin <qufiwefefwoyn@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=jql
pkgver=4.0.0
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/yamafaktory/jql/archive/v${pkgver}.tar.gz)
sha512sums=('21c2a84861f0466b7864eb8caaedc4930fb4d7cd9d78bfa1bad300c6090f29938eaf48a6da72383c421a6c13729a48798094ce7a6febabd519cd1412e7eebed4')

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
