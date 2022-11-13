# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager"
pkgver=0.1.6
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/dofi/archive/v$pkgver.tar.gz")
b2sums=('73c2706f5c994e0514b4ee3cffda8a2e2a41a9aa52091b00fede9784df57f010fa5aeafbe4855b796e35a6568527ba4fffd589220ad6a89150a6e3be613edd38')

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
