# Maintainer: Jean-Pierre Bergamin <james@ractive.ch>
# Auto-updated by the release workflow in ractive/hyalo.
pkgname=hyalo-bin
_bin=hyalo
pkgver=0.21.0
pkgrel=1
pkgdesc="CLI for exploring and managing Markdown knowledge bases with YAML frontmatter"
arch=('x86_64' 'aarch64')
url="https://github.com/ractive/hyalo"
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
source_x86_64=("https://github.com/ractive/hyalo/releases/download/v${pkgver}/hyalo-v0.21.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('613bb04f7833411bb64e0d8abfc3561a4081e9bf8d87c2793ef0e921a09c5636')
source_aarch64=("https://github.com/ractive/hyalo/releases/download/v${pkgver}/hyalo-v0.21.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('54447fd1ed747da30a838f80e4a0bae63d3ab88234482c44c40537b38b4ac1af')

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
