# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=cargo-workspaces
pkgver=0.2.36
pkgrel=1
pkgdesc="Cargo plugin for managing cargo workspaces and their crates"
url="https://github.com/pksunkara/cargo-workspaces"
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('33380ec4af55e691058da9930d4245e2f26d89d125ba497b8a4d0491edb5e9b6f55e4574a646e5966399e0ad00ad960e291c4c2b0dbb231cd01ccf8c50ed1477')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
