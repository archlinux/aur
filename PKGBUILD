# Maintainer: qwjyh <urataw421@gmail.com>

pkgname=redu
pkgver=0.2.16
pkgrel=1
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="ncdu for your restic repository"
url="https://github.com/drdo/redu/"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
options=(!lto)
license=('MIT')
sha512sums=('f211460b629d839e95db1c56fbbe8a35661665ab7e3751cc34e31d158fa7d7f46cdc8c009e3986c0090923c22813a1a2bae0ee5c8fd8f35a294bd6b54ff4a683')

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
# Might require further modification depending on the package involved.
prepare() {
  cd "$pkgname-$pkgver" || exit
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver" || exit
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver" || exit
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver" || exit
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2:
