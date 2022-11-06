# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=galerio
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple generator for static HTML flexbox galleries"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/dbrgn/galerio"
license=('MIT' 'Apache')
depends=()
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a07e01dee6c3b95efcc94e4ba9dc059d116194438f30fd91d1664ef635a12b1a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  env CARGO_INCREMENTAL=0 CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  # Install MIT license
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

# vim:set ts=2 sw=2 et:
