# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=iamb
pkgver=0.0.9
pkgrel=1
pkgdesc='A Matrix client for Vim addicts'
arch=('x86_64')
url="https://github.com/ulyssa/iamb"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a5b7a358da8590fee1471f6b98d2abf6617efc47343dd58325b166f7edc9bd02dd95be4353dba33d88c167ad357d2a5ffc973ae7766053775374bdb2c6ca7faa')
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
