# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=license-generator
pkgver=1.3.0
pkgrel=1
pkgdesc="A command line tool that generates LICENSE file"
arch=("x86_64")
url="https://github.com/azu/license-generator"
license=('MIT')
makedepends=('rust')
provides=('license-generator')
conflicts=('license-generator')
source=("https://github.com/azu/license-generator/archive/refs/tags/v1.3.0.tar.gz")
sha256sums=("4a3d0c6c5131654703dc31faedf1d9eba02ce7fe7b59ea1028caa0b2a62c4243")

prepare() {
  cd "$pkgname-$pkgver"
  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

build() {
  cd "$pkgname-$pkgver"

  cargo build -r
}

check() {
  cd "$pkgname-$pkgver"
  cargo test -r
}

package() {
  cd "$pkgname-$pkgver"
  
  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/license-generator"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/license-generator"
}
