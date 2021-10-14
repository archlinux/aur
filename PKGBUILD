# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>

pkgname=stybulate
pkgver=1.1.2
pkgrel=1
pkgdesc='Tabulate with Style'
arch=('x86_64')
url="https://github.com/guigui64/stybulate"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('81dea03fee7e184b93243f94823edf856b3b54ce60540853206afacfd50320a6')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --target $CARCH-unknown-linux-gnu
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen --features cli
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
