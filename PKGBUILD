# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

# https://github.com/orhun/pkgbuilds

pkgname=cargo-workspaces
pkgver=0.2.32
pkgrel=1
pkgdesc="Cargo plugin for managing cargo workspaces and their crates"
url="https://github.com/pksunkara/cargo-workspaces"
depends=('gcc-libs' 'openssl' 'zlib')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c35cf519264f90e54dd40aafb334820204a990844617338515ada63aad3b5159731b8eed475c2c74a07f2eb42bdf5bbb2429901877f2957971ae5a02007934d2')
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
