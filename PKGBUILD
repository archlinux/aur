# Maintainer: FakeMichau <michau.levy@gmail.com>

pkgname=lma
pkgver=1.0.1
pkgrel=1
pkgdesc="terminal-based show organizer (mainly anime) for locally stored episodes"
arch=('x86_64')
url="https://github.com/FakeMichau/lma"
license=('GPL3')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FakeMichau/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('24eb7554cfa76b7fdd553cd984a9dbcda528f15013aa48d390cb5826b95437ce')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release 
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}