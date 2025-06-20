# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.8.1
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('058d9b542734bbc3e19685aecd28cdec1cd142b02f19b0db7e84439f95283fdf5b9ad678685f43c92e8e1a9236637a6b43dad8970f14767fd4812a30515c5f43')
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
