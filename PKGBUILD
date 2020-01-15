# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=cargo-web
pkgver=0.6.26
pkgrel=3
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'openssl')
optdepends=('chromium: needed for tests')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/koute/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ce5ecd8017c07759cb1bdebc15379dead9ae951c2f5f4af5db8cccf0df936036d64ab37379c46fa93cbd29776ac20c2c9d3ab462202849f56e4ad91b0645efb3')

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
  install -Dm755 target/release/cargo-web -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
