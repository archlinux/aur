# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-web
pkgver=0.6.26
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'openssl')
optdepends=('chromium: needed for tests')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/koute/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c550f5696e8728f94bc9adf61952ec56e8fdb2b417259faac9f5139109b198fc')

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
