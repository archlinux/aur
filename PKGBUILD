# Maintainer: kamiduki <kamiduki_0@outlook.com>

pkgname=udiskr
pkgver=0.1.0
pkgrel=1
pkgdesc='Lightweight alternative to udiskie'
url=https://github.com/uriib/udiskr
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
arch=(x86_64 aarch64)
license=(MIT)
depends=(udisks2)
optdepends=('xdg-utils: open directory')
makedepends=(cargo-nightly)
sha256sums=('f6c0b620bb6df03a313b5fb119a733045c2ffff73b2d8afa09de27bcbe1cc4c7')

prepare() {
  cd $pkgname-$pkgver
  cargo +nightly fetch --locked
}

build() {
  cd $pkgname-$pkgver
  export CARGO_TARGET_DIR=target
  cargo +nightly build --frozen --release -Zbuild-std-features=
}

check() {
  cd $pkgname-$pkgver
  cargo +nightly test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin" target/release/$pkgname
}
