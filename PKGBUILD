# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rebels-in-the-sky
pkgver=1.0.4
pkgrel=1
pkgdesc="P2P terminal game about spacepirates playing basketball across the galaxy"
url="https://github.com/ricott1/rebels-in-the-sky"
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('112b7d495c603184898b4c84bfbbc4d34b5cd05e6b7819fac5752b384385f9dc98b540501892cc3f3b4958671ac4beabaf6f0893b983f132f7c1b173319cc7f3')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

# check() {
#   cd "${pkgname}-${pkgver}"
#   cargo test --frozen -- --skip "test_game"
# }

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/rebels" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
