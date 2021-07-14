# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-workspaces
pkgver=0.2.21
pkgrel=1
pkgdesc="Cargo plugin for managing cargo workspaces and their crates"
url="https://github.com/pksunkara/cargo-workspaces"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pksunkara/cargo-workspaces/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha512sums=('c96f6b8ea96dddfeb76052df0e7da072b4ee2d2e5c24eb8ad853861374d117f4a5f50382761e113fc15d248d1e4773f7f1aff3942c727206b31c0679867aa83d')

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
