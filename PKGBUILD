# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=sea-orm-cli
pkgver=0.12.10
pkgrel=1
pkgdesc="CLI for the Sea-Orm crate"
arch=('x86_64')
url="https://www.sea-ql.org/SeaORM/"
license=('MIT' 'Apache')
depends=('sqlite' 'postgresql-libs' 'libmariadbclient')
makedepends=('cargo')
source=("https://github.com/SeaQL/sea-orm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('26cec00754cc1b11b9f8acfe6bbd26b57974f3b933287d29f605a16ea84aafa13fa0e955997314476f0a222822fc5c3908429f43ff4e33f968cc37a79074e600')

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
