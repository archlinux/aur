# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=comchan
_pkgname=ComChan
pkgver=0.1.8
pkgrel=1
pkgdesc="A blazingly fast minimal serial monitor"
arch=('x86_64')
url="https://github.com/Vaishnav-Sabari-Girish/ComChan"
license=('MIT')
depends=('gcc-libs' 'libudev.so')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0ee5b01bfcc94952d6eb99de8f5bac07086ad8cecf8dd828d3b73e49e3463b47')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
