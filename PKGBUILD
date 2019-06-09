# Maintainer: kpcyrd <git@rxv.cc>

pkgname=websocat
pkgver=1.4.0
pkgrel=1
pkgdesc="Command-line client for web sockets, like netcat/curl/socat for ws://"
url="https://github.com/vi/websocat/"
depends=('openssl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MIT')
source=("https://github.com/vi/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e4aa52cf12b364f7322448520fb567f7ee18c92b49c408776302e58854ea59039dc46b80a7d7658ff30d075fe768005b8911359cc333262fcc641cf63a643a80')

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
