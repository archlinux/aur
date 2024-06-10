# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=cargo-workspaces
pkgver=0.3.2
pkgrel=1
pkgdesc="Cargo plugin for managing cargo workspaces and their crates"
url="https://github.com/pksunkara/cargo-workspaces"
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2d9356c94e9b0c37bc96d58591571c01102844489af99d3887b7aaf181d4163a42a97188d3af04a79d21becf5497c9f96e9723a8b3e601f42e9ca2365908c582')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}/${pkgname}"
  cargo build --release --frozen
}

# check() {
#   cd "${pkgname}-${pkgver}/${pkgname}"
#   cargo test --frozen
# }

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
