# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=sea-orm-cli
pkgver=0.10.5
pkgrel=1
pkgdesc="CLI for the Sea-Orm crate"
arch=('x86_64')
url="https://www.sea-ql.org/SeaORM/"
license=('MIT' 'Apache')
depends=('sqlite' 'postgresql-libs' 'libmariadbclient')
makedepends=('cargo')
source=("https://github.com/SeaQL/sea-orm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9576f4eb06fb193951e5ed734876ab1230f8dc9a14a8e6b4a28f17ac5a950a381e3b589a543693d4cc3d7a63cd7b93d9fa07edb536c719efc88aea3c3870d71f')

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
