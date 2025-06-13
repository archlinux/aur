# Maintainer: levinion <levinnion@gmail.com>
pkgname=stor
pkgver=0.1.1
pkgrel=1
pkgdesc="Stor is an alternative to GNU Stow written in rust."
url="https://github.com/levinion/stor"
arch=("any")
license=("GPLv3")
depends=('gcc-libs' 'glibc')
makedepends=("cargo" "git")
provides=("stor")
conflicts=("stor-bin")
source=(
  "$pkgname::git+https://github.com/levinion/$pkgname.git"
)
sha256sums=('SKIP')

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
  install -Dm644 "completions/zsh/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
