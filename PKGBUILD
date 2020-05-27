# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=jql
pkgver=2.6.0
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(https://github.com/yamafaktory/jql/archive/v${pkgver}.tar.gz)
sha512sums=('8a6465d6e40207af09af9535eb8fa878d7ba26d4c02b44938885003c2932413729d7f1a3b9e0f2fdaafc062a79c7dd38f10f76c5c50356e2ae5d168c2007d412')

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
