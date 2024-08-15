# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ducker
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal app for managing docker containers"
url="https://github.com/robertpsoane/ducker"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6d61f6efc282184605c06140b981ff2de29d02f6ddc6f2365f603735c08f2361d24f3e7a3c81bd4cc94cfc070df1fbf32297e4dce2979087ea7d3650f5138313')
options=('!lto')

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
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
