# Maintainer: loefey loefey@proton.me
pkgname=thundery
pkgver=1.0.2
pkgrel=1
pkgdesc="A weather fetching cli"
arch=('x86_64')
url="https://github.com/loefey/thundery"
license=('GNU General Public License v3.0')
depends=('glibc')
makedepends=('cargo' 'git')
source=("git+https://github.com/loefey/thundery")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
