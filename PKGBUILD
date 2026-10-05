# Maintainer: Jean-Pierre Bergamin <james@ractive.ch>
# Auto-updated by the release workflow in ractive/ff-rdp.
pkgname=ff-rdp-bin
_bin=ff-rdp
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI for Firefox Remote Debugging Protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/ractive/ff-rdp"
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
source_x86_64=("https://github.com/ractive/ff-rdp/releases/download/v${pkgver}/ff-rdp-v0.4.1-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('73e3e881a8aec62b3d10d5956051179389f5ad5d84ac748b12ba211bde2b9ea8')
source_aarch64=("https://github.com/ractive/ff-rdp/releases/download/v${pkgver}/ff-rdp-v0.4.1-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('20bbc313d906e7948da6441b792601fd3ec85ad2bfd907917a5f8957de73b8f1')

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
