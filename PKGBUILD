# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager"
pkgver=0.1.11
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/dofi/archive/v$pkgver.tar.gz")
b2sums=('afdbc70cad367df493580413d444a1c50d43270c1cacb7f48f669caa4d56fbb353d9d40a493e853e5cf3f137d962742a216ad91be1c8d5aaf6540d5c0912b698')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  RUSTUP_TOOLCHAIN=stable \
    cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 "target/release/dofi" "$pkgdir/usr/bin/dofi"
  install -Dm644 "share/completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/dofi.fish"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
