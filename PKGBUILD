# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-hack
pkgver=0.5.17
pkgrel=1
pkgdesc="A cargo subcommand to provide various options useful for testing and continuous integration"
url="https://github.com/taiki-e/cargo-hack"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/taiki-e/cargo-hack/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('40a6315173afdde0d90b31b78407fb1750376a9d351be94af014fb558aca5943f1f98a607f6da7cb7e5b1d8567b885e2ab62e6045a3e9347d4a833e0d6af1094')

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
