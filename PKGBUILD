# Maintainer: Akatsuki Rui <akiirui@outlook.com>

_pkgname="dofi"
pkgname="dofi-manager"
pkgver=0.1.10
pkgrel=1
pkgdesc="A simple dotfile manager"
arch=("x86_64")
makedepends=("cargo" "git")
url="https://github.com/akiirui/dofi"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/akiirui/dofi/archive/v$pkgver.tar.gz")
b2sums=('5235a53e82739c19b9c5687c28ca86aa50f6e62020bb464d5fe670d9b4f182ad8e90a30a88e188c670aff9102349a4484e1864b1fd3b1209fba865a211afaf1a')

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
