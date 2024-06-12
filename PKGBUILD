# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=impala
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI for managing wifi"
url="https://github.com/pythops/impala"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('41b7148755944e306afab6d15b93f03975f2a18aa653468f4f50dcf9f4812670dd3b3271c4327d9b832a3736ed6f48632b9a5ab5898bc9a5de9fe028ba08c083')

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
  install -Dm 644 Readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
