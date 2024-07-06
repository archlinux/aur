# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=boringtun
pkgver=0.5.2
pkgrel=4
pkgdesc="Userspace WireGuard implementation in Rust"
arch=('i686' 'x86_64')
url="https://github.com/cloudflare/boringtun"
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/cloudflare/boringtun/archive/refs/tags/boringtun-$pkgver.tar.gz")
sha256sums=('660f69e20b1980b8e75dc0373dfe137f58fb02b105d3b9d03f35e1ce299d61b3')


prepare() {
  cd "$pkgname-$pkgname-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update \
      --workspace
  fi
  cargo fetch \
    --manifest-path "$pkgname-cli/Cargo.toml"
}

check() {
  cd "$pkgname-$pkgname-$pkgver"

  #cargo test \
  #  --frozen \
  #  --manifest-path "$pkgname-cli/Cargo.toml"
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgname-$pkgver/$pkgname-cli"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/boringtun"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/boringtun"
}
