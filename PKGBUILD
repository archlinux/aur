# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lychee-rs
_pkgname=lychee
pkgver=0.4.0
pkgrel=1
pkgdesc="A glorious link checker"
arch=('x86_64')
url="https://github.com/lycheeverse/lychee"
license=('Apache')
depends=('openssl' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('85c856a42ee03d71f179210bec6f55625d45f2cfe847752ac201f0f2bc7b495e3a02957aa682a53c2e71962e51368c3bf7f816128d51c4968bcc52ddac16a0c5')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
