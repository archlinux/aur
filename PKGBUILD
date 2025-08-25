# Maintainer: levinion <levinnion@gmail.com>
pkgname=fzfmenu
pkgver=0.1.0
pkgrel=2
pkgdesc="An application launcher based on fzf "
url="https://github.com/levinion/fzfmenu"
arch=("any")
license=("GPLv3")
depends=("gcc-libs" "glibc" "fzf")
makedepends=("cargo" "git")
provides=("fzfmenu")
source=(
  "$pkgname::git+https://github.com/levinion/$pkgname.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
