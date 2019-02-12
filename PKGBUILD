# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-vendor
pkgver=0.1.23
pkgrel=2
pkgdesc="Cargo subcommand to vendor crates.io dependencies"
url="https://github.com/alexcrichton/cargo-vendor"
depends=('curl')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alexcrichton/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e0f0872d6de590b1dbacd98efa80362b0872d58c64d3c366ce3690f33162d0281519322b55779dec99b99b18282cb87201da338ed8afbed91ff49424ba1b23ca')

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
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
