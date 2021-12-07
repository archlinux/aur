# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=frum
pkgver=0.1.2
pkgrel=1
pkgdesc="A little bit fast and modern Ruby version manager written in Rust"
arch=("x86_64")
url="https://github.com/TaKO8Ki/frum"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0a67d12976b50f39111c92fa0d0e6bf0ae6612a0325c31724ea3a6b831882b5d')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p \
    "$pkgdir"/usr/share/bash-completion/completions \
    "$pkgdir"/usr/share/fish/vendor_completions.d \
    "$pkgdir"/usr/share/zsh/site-functions
  "$pkgdir/usr/bin/$pkgname" completions -s bash > "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  "$pkgdir/usr/bin/$pkgname" completions -s fish > "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish
  "$pkgdir/usr/bin/$pkgname" completions -s zsh > "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
}
