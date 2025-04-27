# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.7.0
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('42a39f413963349d981a125f817e5bcdd25ebeda8997eb7fa850c77084b830d492ed78eda3aa51d600e017fe2bb83b10adc52652b49c39e96b6d3334ffb566f6')
options=(!lto)

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/battered" "$pkgdir/usr/bin/battered"

  # Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # systemd unit
  install -Dm644 "examples/battered.service" "$pkgdir/usr/lib/systemd/user/battered.service"
}
