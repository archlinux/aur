# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=fnm
pkgver=1.29.2
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built with Rust"
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
makedepends=('cargo')
conflicts=('fnm-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dca05a18787945d3d47882223266185045f9d806f1bcd193d14774f461280e30')

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
