# Maintainer: Lev Sauliak levizorri@protonmail.com
# Maintainer: Elias Dev elias.devis@protonmail.com
# Contributor:

pkgname=tray-tui
pkgver=0.3.1
pkgrel=4
pkgdesc="System tray in your terminal"
arch=('x86_64')
url="https://github.com/Levizor/tray-tui"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/Levizor/tray-tui/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e844a490dc0eb1331ede79e6af3f31c3e8970f8dce6e0530c61a4bd2bca4f0e2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo fetch --locked

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 <("$pkgdir/usr/bin/$pkgname" --completions bash) \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 <("$pkgdir/usr/bin/$pkgname" --completions zsh) \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 <("$pkgdir/usr/bin/$pkgname" --completions fish) \
    "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

}
