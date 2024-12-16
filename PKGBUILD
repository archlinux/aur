# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=yozefu
_pkgname=yozf
pkgver=0.0.2
pkgrel=1
pkgdesc="A TUI for exploring data in Kafka clusters"
arch=('x86_64')
url="https://github.com/MAIF/yozefu"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e6f1b25a60e1e18cecc9b3e4f8640e6cea17e16f0fd20712e568eed21a8d98c5732f53097c8a19a719e9ce2d78f33ea01aefb647c129f54a2a7487df60680fc7')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
