# Maintainer: Jean-Pierre Bergamin <james@ractive.ch>
# Auto-updated by the release workflow in ractive/ff-rdp.
pkgname=ff-rdp-bin
_bin=ff-rdp
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI for Firefox Remote Debugging Protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/ractive/ff-rdp"
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
source_x86_64=("https://github.com/ractive/ff-rdp/releases/download/v${pkgver}/ff-rdp-v0.5.0-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('5f18790e44a3208dfaa8588b72ccad2e033a135c0b48a2ce9e49043c2fab3909')
source_aarch64=("https://github.com/ractive/ff-rdp/releases/download/v${pkgver}/ff-rdp-v0.5.0-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('437269fcd10b6deed0a23625d5094ba3768782d973e5b525a21c192390de04f3')

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
