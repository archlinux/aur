# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=cargo-hack
pkgver=0.5.8
pkgrel=1
pkgdesc="A cargo subcommand to provide various options useful for testing and continuous integration"
url="https://github.com/taiki-e/cargo-hack"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=(https://github.com/taiki-e/cargo-hack/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('8599f3020f58e21dc59e74f55f6fba243b354bbd1999a16b757813d4c1d956254a4cf847891a6dac822e3496fce9af9632092e51460d18c5da3a359bda93ef54')

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
