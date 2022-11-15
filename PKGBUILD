# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager"
pkgver=0.1.7
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/dofi/archive/v$pkgver.tar.gz")
b2sums=('8ce8c7d4e265c61cd412f48a246dbb1738b1856fa2837ff0c0dd166af3192b65b4949e8f8a70c8ad6d623260ca4960010227ac80f4a807c2dcd238f1294f7119')

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
