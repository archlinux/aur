# Maintainer: qwjyh <urataw421@gmail.com>

pkgname=redu
pkgver=0.2.14
pkgrel=1
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="ncdu for your restic repository"
url="https://github.com/drdo/redu/"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
options=(!lto)
license=('MIT')
sha512sums=('04ae8619b2d0e46d1e09033e86c76cae8d9abb03d96fac2eb969647b879879798802123068307a1ee3e7059953aa1a05f37979a9c0d5b62db30c6d9f871bb0bb')

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
