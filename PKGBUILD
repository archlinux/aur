# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=frum-bin
pkgver=0.1.2
pkgrel=3
pkgdesc="A little bit fast and modern Ruby version manager written in Rust"
arch=("x86_64")
url="https://github.com/TaKO8Ki/frum"
license=("MIT")
provides=("frum")
conflicts=("frum" "frum-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/frum-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('0acd1ffa7fb67cb20284f4ea9d7c18743e7aed3bf0319c7c63ef0e75fcbb0e3b')

package() {
  mkdir -p "$pkgdir/opt/frum"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/frum-v$pkgver-x86_64-unknown-linux-musl/." "$pkgdir/opt/frum"
  ln -s "/opt/frum/frum" "$pkgdir/usr/bin/frum"

  chmod +x "$pkgdir/opt/frum"

  mkdir -p "$pkgdir"/usr/share/bash-completion/completions
  "$pkgdir/opt/frum/frum" completions --shell bash > "$pkgdir"/usr/share/bash-completion/completions/frum

  mkdir -p "$pkgdir"/usr/share/fish/vendor_completions.d
  "$pkgdir/opt/frum/frum" completions --shell fish > "$pkgdir"/usr/share/fish/vendor_completions.d/frum.fish

  mkdir -p "$pkgdir"/usr/share/zsh/site-functions
  "$pkgdir/opt/frum/frum" completions --shell zsh > "$pkgdir"/usr/share/zsh/site-functions/_frum
}
