# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager"
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/dofi/archive/v$pkgver.tar.gz")
b2sums=('9058a12de786653b90f37f5488e05c7001f40b8c70efd5b7b465d98f1f7333d2ce5e6fd1c4246b3ca44a3b95658899d730050d82ce1fefa90e6b37d1bfb70b5d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  RUSTUP_TOOLCHAIN=stable \
    cargo build --locked --bin dofi --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 "target/release/dofi" "$pkgdir/usr/bin/dofi"
  install -Dm644 "share/completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/dofi.fish"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
