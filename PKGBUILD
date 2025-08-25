# Maintainer: levinion <levinnion@gmail.com>
pkgname=fzfmenu
pkgver=r14.e2d9810
pkgrel=1
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
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
