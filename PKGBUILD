# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: kpcyrd <git@rxv.cc>

pkgname=websocat
pkgver=1.6.0
pkgrel=1
pkgdesc="Command-line client for web sockets, like netcat/curl/socat for ws://"
url="https://github.com/vi/websocat/"
depends=('openssl')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MIT')
source=("https://github.com/vi/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e41d69541d9322f43f0296fe853777372b7f1d011839a0f860e8cbbe37bdac61267d1f33e198a650bf830626fc621745e204bb5a0ba5c7317afa972ff22ada9c')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/websocat -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

