# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ducker
pkgver=0.0.2
pkgrel=1
pkgdesc="A terminal app for managing docker containers"
url="https://github.com/robertpsoane/ducker"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9266b2f206617382e56c61651bdd7f238013be6ca2ba5f41ce19f2ca292a67be91049c32fb40c2c48b9f5995838a93be208fddb5454d61fe79a77991da0ee917')

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
