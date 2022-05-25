# Maintainer: Constantine Fedotov <zenflak@gmail.com>
# Contributor: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-hack
pkgver=0.5.13
pkgrel=1
pkgdesc="A cargo subcommand to provide various options useful for testing and continuous integration"
url="https://github.com/taiki-e/cargo-hack"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/taiki-e/cargo-hack/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('4c34a03dc0fcc51324b261ab224e0ce984d526e27953c3a2eb8d76ed2099ad55224ed9966b9a40f5d8c2c59ef4df2f0e0b89d3f5a24512c8ef33067a2e2595b7')

build() {
  cd "cargo-hack-${pkgver}"
  cargo build --release --package ${pkgname}
}

check() {
  cd "cargo-hack-${pkgver}"
  cargo test --release --package ${pkgname}
}

package() {
  cd "cargo-hack-${pkgver}"
  install -Dm755 \
    "target/release/${pkgname}" \
    -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
