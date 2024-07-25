# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=sxtetris
pkgver=1.3.1
pkgrel=1
pkgdesc="A terminal Tetris game"
url="https://github.com/shixinhuang99/sxtetris"
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('65b53bdf1879575a34dcd243964cb74823da48f882fc03ac8d8774db57da5f052b83c9782a694cc3761d8769ed351ee3cf6d9534847e41c4a5b6263c7b7b6734')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
