# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=impala
pkgver=0.2.1
pkgrel=1
pkgdesc="TUI for managing wifi"
url="https://github.com/pythops/impala"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('GPL-3.0')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ee1dd2e43dfdd87c8e69b41131a10e76a03df3a2f4cbb75e840ca7f1bd18f786e3bc1e468966bda1c0d8caef2a3d688f3c57775bd7d2f0d8e277486f8e9184c9')

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
