# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-hack
pkgver=0.5.18
pkgrel=1
pkgdesc="A cargo subcommand to provide various options useful for testing and continuous integration"
url="https://github.com/taiki-e/cargo-hack"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/taiki-e/cargo-hack/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('9a00796754ada2b828765b35e1369c0a64fd9d9d974beabde5c737bc19d5331a67da2199c30a95aa92fd91a1e023672f835201fda63f9eea39f890d6ad30e40f')

build() {
  cd "cargo-hack-${pkgver}"
  cargo build --release --package ${pkgname}
}

check() {
  cd "cargo-hack-${pkgver}"
  cargo test --release --package ${pkgname}
}

package() {
  cd "cargo-hack-${pkgver}"
  install -Dm755 \
    "target/release/${pkgname}" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
