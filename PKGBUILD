# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-web
pkgver=0.6.25
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'openssl')
optdepends=('chromium: needed for tests')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/koute/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e91ea462ec3caaa19c89dfe88686b6e08cc0993755e4c95a7057c248eff64c5c')

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
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
