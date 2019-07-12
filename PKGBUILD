# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-bloat
pkgver=0.7.1
pkgrel=1
pkgdesc="Find out what takes most of the space in your executable"
url="https://github.com/RazrFalcon/cargo-bloat"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RazrFalcon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('417b632776a6e8bc43ea6692511f24c893a7863e14798c5fa733d3808885c525')

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
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
