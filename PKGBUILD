# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit
pkgver=0.1.1
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk"
arch=('x86_64')
url="https://github.com/Skallwar/suckit"
license=('Apache')
depends=('openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b1da8cf552980925a192164dce091dd9e68ea242c19d1caf0d1bb029dbf532b7bdddf2d58458496de1da181541eea19252e2f5fc8af7c2fa49d87c1faf8c9a88')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  # TODO: add `--release` flag after new release
  # https://github.com/Skallwar/suckit/commit/d9c17d9ec2459732ca0dee7b057002ecf7efd04a
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
