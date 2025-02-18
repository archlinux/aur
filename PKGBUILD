# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=yozefu
_pkgname=yozf
pkgver=0.0.8
pkgrel=1
pkgdesc="A TUI for exploring data in Kafka clusters"
arch=('x86_64')
url="https://github.com/MAIF/yozefu"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fc0dc54a9ffc5b2adecde53d3bbfe846686c70ceec7ef82bccb3c15ef311621165a391704d1ba0db8c3212a54bd14671e106b145102267120cc900cba9aa7eef')
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
