# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-local-registry
pkgver=0.2.1
pkgrel=1
pkgdesc="A cargo subcommand to manage local registries"
url="https://github.com/alexcrichton/cargo-local-registry"
depends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexcrichton/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ac13a00f95166a5fcd0343a7727ef3c9b49965e07700b2ceb3a687a35786df55ea1d9157d535c94c06b7d135ae61e87197a4e77237c4e1387f48c33dfeb69d17')

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
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
