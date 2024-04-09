# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=sea-orm-cli
pkgver=0.12.15
pkgrel=1
pkgdesc="CLI for the Sea-Orm crate"
arch=('x86_64')
url="https://www.sea-ql.org/SeaORM/"
license=('MIT' 'Apache')
depends=('sqlite' 'postgresql-libs' 'libmariadbclient')
makedepends=('cargo')
source=("https://github.com/SeaQL/sea-orm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('323c5fb24542178a66ca3c73d549de5ea74d7ce88c51b6efecbd4481bf4396583e525db70b2ccb216ff8c1abf3a351e00230e3354cbfd0ef9f48f2eb54d3b393')
options=('!lto')

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
