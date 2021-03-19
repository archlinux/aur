# Maintainer: gbr <gbr@protonmail.com>

pkgname=sfz
pkgver=0.4.0
pkgrel=1
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64' 'aarch64')
url=https://github.com/weihanglo/sfz
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f6f95470ee2d839c0086aa6f5397a5b6937692907e688800f2af610b7fb8e69ea23cef4daa8696fce93fd388774a6206b8b8a9f355e19cb8bf7112b11828bfd7')

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
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

