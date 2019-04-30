# Maintainer: kpcyrd <git@rxv.cc>

pkgname=graphql-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line tool for working with graphql written in rust"
url="https://github.com/tailhook/graphql-cli"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('MIT' 'Apache')
source=("https://github.com/tailhook/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c296fbf0b5308f921eb4ee0f4201ccdcf5899cc38d89bd90559aca16190a1d69')

build() {
  cd "${pkgname}-${pkgver}"
  # lockfile is outdated
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/graphql" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
