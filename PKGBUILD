# Maintainer: lmartinez-mirror
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=dutree
pkgver=0.2.17
pkgrel=2
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url=https://github.com/nachoparker/dutree
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c88f2328c4e6cf96a0222efbe2a5c6d2de8cd0de0ebf01deb1f5fe81b5f8518e')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/0.2.16/$pkgver/" Cargo.lock
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
}
