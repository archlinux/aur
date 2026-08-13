# Maintainer: Jean-Pierre Bergamin <james@ractive.ch>
# Auto-updated by the release workflow in ractive/hoppy.
pkgname=hoppy-bin
_bin=hoppy
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI for bunny.net cloud and edge services"
arch=('x86_64' 'aarch64')
url="https://github.com/ractive/hoppy"
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
source_x86_64=("https://github.com/ractive/hoppy/releases/download/v${pkgver}/hoppy-v0.7.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('e2df2ce040933a385b9ed5e753b10519c29ba2ea07fc5edc707ba0f4c8e6ba41')
source_aarch64=("https://github.com/ractive/hoppy/releases/download/v${pkgver}/hoppy-v0.7.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('031ff5c6a2ad788251df79ab6fd5a70ef90223ed76b8d06cc51479ab28456986')

package() {
  install -Dm755 "$_bin" "$pkgdir/usr/bin/$_bin"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
  if [ -f "completions/$_bin.bash" ]; then
    install -Dm644 "completions/$_bin.bash" "$pkgdir/usr/share/bash-completion/completions/$_bin"
  fi
  if [ -f "completions/_$_bin" ]; then
    install -Dm644 "completions/_$_bin" "$pkgdir/usr/share/zsh/site-functions/_$_bin"
  fi
  if [ -f "completions/$_bin.fish" ]; then
    install -Dm644 "completions/$_bin.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_bin.fish"
  fi
  if compgen -G "man/*.1" > /dev/null; then
    for m in man/*.1; do
      install -Dm644 "$m" "$pkgdir/usr/share/man/man1/$(basename "$m")"
    done
  fi
}
