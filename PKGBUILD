# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit
pkgver=0.1.0
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk"
arch=('x86_64')
url="https://github.com/Skallwar/suckit"
license=('Apache')
depends=('openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8ab90817a780bb69c060482fce9c9e501eac8ff8e73cff4b964e08334a5ce506ef08c0f23c3811b15db314a5e9c6f3711326646d993602e31344bac11f31fdf3')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  # TODO: add `--release` flag after new release
  # https://github.com/Skallwar/suckit/commit/d9c17d9ec2459732ca0dee7b057002ecf7efd04a
  cargo test --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
