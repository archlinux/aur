# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=tracker
pkgver=0.1.5
pkgrel=1
pkgdesc="A terminal-based real-time satellite tracking and orbit prediction application"
arch=('x86_64')
url="https://github.com/ShenMian/tracker"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e7a0c1d6ce8b346a8e66cd8da787fcba8a1a8c3f79f4c7a958d78f51fe215f6c2a0dfee58419651441b6963b57a684647b2b317641dc4130c33c5b3be0e42697')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
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
