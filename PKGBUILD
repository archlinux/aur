# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=fnm
pkgver=1.29.1
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built with Rust"
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
makedepends=('cargo')
conflicts=('fnm-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('87c4c6afee02dc1c97138a6e048382463a03faa116d9381f80a55e67398f8425')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  mkdir -p \
    "$pkgdir"/usr/share/bash-completion/completions \
    "$pkgdir"/usr/share/fish/vendor_completions.d \
    "$pkgdir"/usr/share/zsh/site-functions
  "$pkgdir/usr/bin/$pkgname" completions --shell bash > "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  "$pkgdir/usr/bin/$pkgname" completions --shell fish > "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish
  "$pkgdir/usr/bin/$pkgname" completions --shell zsh > "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
}
