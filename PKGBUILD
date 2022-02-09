# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=jless
pkgver=0.7.1
pkgrel=1
pkgdesc='A command-line pager for JSON data.'
arch=('any')
url="https://github.com/PaulJuliusMartinez/jless"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b36d117ac0ef52fa0261e06b88b5ae77c2ff4beeb54f2c906a57f066dc46179')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
