# Maintainer: Jean-Pierre Bergamin <james@ractive.ch>
# Auto-updated by the release workflow in ractive/hyalo.
pkgname=hyalo-bin
_bin=hyalo
pkgver=0.24.0
pkgrel=1
pkgdesc="CLI for exploring and managing Markdown knowledge bases with YAML frontmatter"
arch=('x86_64' 'aarch64')
url="https://github.com/ractive/hyalo"
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
source_x86_64=("https://github.com/ractive/hyalo/releases/download/v${pkgver}/hyalo-v0.24.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('1a42237ee00b8d587a6c0b0a83b38ff6fbb1863b1aab3f39bf77b74a5cba770c')
source_aarch64=("https://github.com/ractive/hyalo/releases/download/v${pkgver}/hyalo-v0.24.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('2f4fd85e415740b2460ed25b58e71b8c377e186b46e9ea49c9a186176f3e5768')

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
