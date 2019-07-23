# Maintainer: kpcyrd <git@rxv.cc>

pkgname=websocat
pkgver=1.5.0
pkgrel=1
pkgdesc="Command-line client for web sockets, like netcat/curl/socat for ws://"
url="https://github.com/vi/websocat/"
depends=('openssl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MIT')
source=("https://github.com/vi/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d161aee2153e5fec47e5e81f160abfb7a0b45c5c48f96af341d5d737cd77237fbdf1f9923e80b39a745e19f94ce225b2eb5aa0d03403e4d87ffc4b8b042b4709')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --features=ssl
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked --features=ssl
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/websocat -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
