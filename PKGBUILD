# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=lucid
pkgver=0.3.0
pkgrel=3
pkgdesc='A simple mock-application for programs that work with child processes'
arch=('x86_64')
url="https://github.com/sharkdp/lucid"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01ec59195307ebd921470803f1546785309661fc0fdc0957fd413d3de3cce457')

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
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
