# Maintainer: qwjyh <urataw421@gmail.com>

pkgname=redu
pkgver=0.2.15
pkgrel=1
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="ncdu for your restic repository"
url="https://github.com/drdo/redu/"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
options=(!lto)
license=('MIT')
sha512sums=('e38cd87301ef963b9dc3946fd8df0f41066f03aff0489215011d2ecb5bfecd59a4fcb3cf7a64c835014408262b5afe6f92a01431d325cef885779b578fd6b6b6')

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
