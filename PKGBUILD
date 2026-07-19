# Maintainer: Jean-Pierre Bergamin <james@ractive.ch>
# Auto-updated by the release workflow in ractive/hyalo.
pkgname=hyalo-bin
_bin=hyalo
pkgver=0.20.0
pkgrel=1
pkgdesc="CLI for exploring and managing Markdown knowledge bases with YAML frontmatter"
arch=('x86_64' 'aarch64')
url="https://github.com/ractive/hyalo"
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
source_x86_64=("https://github.com/ractive/hyalo/releases/download/v${pkgver}/hyalo-v0.20.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('eca964e558b39adbd43f6b97bdae705613a0304e056f71947d748930ccd6a073')
source_aarch64=("https://github.com/ractive/hyalo/releases/download/v${pkgver}/hyalo-v0.20.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('b8d075277d9811de383ff06d60ff245309e2d235570471eeebab5c7c22907b38')

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
