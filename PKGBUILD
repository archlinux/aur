# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=iamb
pkgver=0.0.8
pkgrel=1
pkgdesc='A Matrix client for Vim addicts'
arch=('x86_64')
url="https://github.com/ulyssa/iamb"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f8e57a11d6344573c3c3d0c18f09d59affad2ab36be4c89d5e0657d17540ecef67b685d1fe574828bbb7c5963d52505f23f66e17c62072ca3b11f1ae594e4ae1')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  VERGEN_GIT_SHA="Arch Linux" cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
