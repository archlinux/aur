# Maintainer: neoney <neo@neoney.dev>
_pkgname="shadower"
pkgname="$_pkgname"-git
pkgver=r3.62f00fd
pkgrel=1
pkgdesc="A simple CLI utility to add rounded borders and shadows to images."
arch=('any')
url="https://github.com/n3oney/shadower"
license=('MIT')
makedepends=('rust' 'cargo' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/n3oney/shadower.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
