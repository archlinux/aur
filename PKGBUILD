# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-workspaces
pkgver=0.2.23
pkgrel=1
pkgdesc="Cargo plugin for managing cargo workspaces and their crates"
url="https://github.com/pksunkara/cargo-workspaces"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pksunkara/cargo-workspaces/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha512sums=('debaf1896b0e958cc0f41f619996cf65d250dc529f3722d9ce634ff1f0004349eac45533be30d08aa5230f9f453e406008174af9adbb827fb2997677f427d9b0')

build() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo test --release
}

package() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  install -Dm755 \
    "target/release/${pkgname}" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
