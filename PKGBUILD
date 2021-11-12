# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mdbook-linkcheck
pkgver=0.7.6
pkgrel=1
pkgdesc="A mdbook backend which will check all links in a document are valid"
arch=('x86_64')
url="https://github.com/Michael-F-Bryan/mdbook-linkcheck"
license=('MIT')
depends=('mdbook')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3accd5b189dfe3808c7ab6bd80aab9444b74db6fc55984817393c61bcfc14543cec7acb88f37baa2b39b9b3062104f79720858d8ac0cc5b9db6ae278469826f9')
b2sums=('f79f1c61bcb66d31531cdde9ab01ca0b3ab2594250545eb60d59bd2051c6b82ec2628a17eaa103899b302f1c3335d8ee48256745d3dda234bbf6250a48eeb5e6')

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
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
