# Maintainer: FakeMichau <michau.levy@gmail.com>

pkgname=lma
pkgver=1.0.2
pkgrel=1
pkgdesc="terminal-based show organizer (mainly anime) for locally stored episodes"
arch=('x86_64')
url="https://github.com/FakeMichau/lma"
license=('GPL3')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FakeMichau/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0a0eea0c2f6b36ea43c35d67e2b964ea786204ae01a81e864dde8d54094d6a88')

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