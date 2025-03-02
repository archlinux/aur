# Maintainer: Lev Sauliak levizorri@protonmail.com
# Contributor: 

pkgname=tray-tui
pkgver=0.2.0
pkgrel=1
pkgdesc="System tray in your terminal"
arch=('x86_64')
url="https://github.com/Levizor/tray-tui"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/Levizor/tray-tui/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0b15b535543448c7657df0ae4f7be90d255b68869261d3bfb8388c27a9341f7f')

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

