# Maintainer: kamiduki <kamiduki_0@outlook.com>

pkgname=udiskr
pkgver=0.1.1
pkgrel=1
pkgdesc='Lightweight alternative to udiskie'
url=https://github.com/uriib/udiskr
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
arch=(x86_64 aarch64)
license=(MIT)
depends=(udisks2)
optdepends=('xdg-utils: open directory')
makedepends=(cargo-nightly)
sha256sums=('da8b5b030c122791ce5f23def660b5dc01665ce8d684d9e58ffbb21af322df49')

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
