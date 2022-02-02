# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=fnm
pkgver=1.30.1
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built with Rust"
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
makedepends=('cargo')
conflicts=('fnm-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5b1ad1e23c10d38b85a27b87affa7275a1116ecab8fa36b7040bfbbbaafbaa4c')

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
