# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=asak
pkgver=0.3.3
pkgrel=1
pkgdesc="A cross-platform audio recording/playback tool"
arch=('x86_64')
url="https://github.com/chaosprint/asak"
license=('MIT')
depends=('gcc-libs' 'alsa-lib' 'jack2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d9e5ed65e9c7912820a49169e1294971014183578a6e1348e97ef91bcbdb7d2a1525374cdd563fabfcd409160ea0dc948b488e988a2694f89f61a20f597e3f6f')

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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
