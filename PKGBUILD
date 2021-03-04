# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-workspaces
pkgver=0.2.17
pkgrel=1
pkgdesc="Cargo plugin for managing cargo workspaces and their crates"
url="https://github.com/pksunkara/cargo-workspaces"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pksunkara/cargo-workspaces/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha512sums=('39278596ab6d926871559030d142a44adb74b252e839b1065cbd4b3071e5764112e67c67fc64e28d4c2ba91690c6836eb8ce020b1980ccdb15deebaae2a14676')

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
