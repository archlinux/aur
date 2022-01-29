# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-hack
pkgver=0.5.12
pkgrel=1
pkgdesc="A cargo subcommand to provide various options useful for testing and continuous integration"
url="https://github.com/taiki-e/cargo-hack"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/taiki-e/cargo-hack/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('1be2672cb5bab0a31c1d5522566afd1186f56d10e9d5a5759c26b3e5d947ba26329fee307e7ae31a1a41d224b6cdabc40c86e72e17abb36bf2f1905b954fe5e9')

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
