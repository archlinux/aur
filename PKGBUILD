# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=jql
pkgver=2.8.0
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/yamafaktory/jql/archive/v${pkgver}.tar.gz)
sha512sums=('8ca1e16e3413d7f81ad6ac2ca3c0312f7dedcdc0fb536e97e73b33d8a4a3cfbd3aac6f15a5b6fa27ae7863acead9609e8729d9e5239e5026840931cbd7ee67a4')

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
