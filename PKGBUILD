# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=doctave
pkgver=0.3.1
pkgrel=1
pkgdesc="A batteries-included developer documentation site generator"
arch=('x86_64')
url="https://www.doctave.com"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Doctave/doctave/archive/$pkgver.tar.gz")
sha512sums=('cc51436834c0adf30c4b9ef14f45be4d2505cc20162fb89874194d722a3e135a0fb449dc8005e09188c59c37a395e000cfad025c629c91abc8ac9d75492655b1')
b2sums=('906301b9bbec973a26da98663d1d9f3f0d1941ad847ce65a0341f800a09a771dbdd7575d9195c1a74665b7ac5bcfbc0b34d8f207c6b35788d4a9c0d4e4303522')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/doctave

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
