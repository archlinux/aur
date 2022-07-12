# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=sea-orm-cli
pkgver=0.9.0
pkgrel=1
pkgdesc="CLI for the Sea-Orm crate"
arch=('x86_64')
url="https://www.sea-ql.org/SeaORM/"
license=('MIT' 'Apache')
depends=('sqlite' 'postgresql-libs' 'libmariadbclient')
makedepends=('cargo')
source=("https://github.com/SeaQL/sea-orm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f8ad4418cfc85800cb7f1c0598a7c7b20ae691bedd2c2053a2b2a3696187bc45835fac04e75a53be8c9b65b2378f27ace4a4be1c2021af9263e8ea21361de82c')

prepare() {
  # Enter the sea-orm-cli source folder downloaded from GitHub
  cd "sea-orm-${pkgver}/sea-orm-cli"
  # Fetch the dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  # Enter the sea-orm-cli source folder downloaded from GitHub
  cd "sea-orm-${pkgver}/sea-orm-cli"
  # Build the binary with the "Release" profile (enables all the optimizations)
  cargo build --release
}

package() {
  # Enter the sea-orm source folder downloaded from GitHub
  cd "sea-orm-${pkgver}"
  # Install the compiled CLI tool
  install -Dm755 "sea-orm-cli/target/release/sea-orm-cli" "${pkgdir}/usr/bin/sea-orm-cli"
  # Install the license files
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
