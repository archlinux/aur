# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

pkgname=battered
pkgver=0.8.0
pkgrel=1
pkgdesc="Regularly polls battery levels and reacts to crossing configurable thresholds."
arch=('x86_64')
url="https://github.com/t4k1t/battered"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4k1t/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fbcb61d9353e400fcff2335beee6a36871c51d811758c6f457ae6d92679044561994e0214fa122b71976541138b0221608dbd42d09c9f6bdfcde78be2ca7a8db')
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
