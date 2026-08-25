# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=elan-lean-bin
pkgver=4.2.4
pkgrel=1
pkgdesc="Lean version manager"
arch=('aarch64' 'x86_64')
url="https://github.com/leanprover/elan"
license=('Apache-2.0' 'MIT')
provides=("elan-lean=$pkgver")
conflicts=('elan-lean')
source=("https://raw.githubusercontent.com/leanprover/elan/refs/heads/master"/LICENSE-{APACHE,MIT})
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/leanprover/elan/releases/download/v$pkgver/elan-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/leanprover/elan/releases/download/v$pkgver/elan-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_aarch64=('05febd124d84ebf994b2e7479922a5650b1e950c17ae3bd1ddd776b65bb72bf9')
sha256sums_x86_64=('42b94d4244e8353142c456ec0e4ca6528fd898a6c604d4059f494e706e431f63')


package() {
  install -Dm755 "$srcdir/elan-init" "$pkgdir/usr/bin/elan"

  _binlinks=('lake' 'lean' 'leanchecker' 'leanpkg')
  for link in "${_binlinks[@]}"; do
    ln -s /usr/bin/elan "$pkgdir/usr/bin/${link}"
  done

  install -d \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/elan" completions bash > "$pkgdir/usr/share/bash-completion/completions/elan"
  "$pkgdir/usr/bin/elan" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/elan.fish"
  "$pkgdir/usr/bin/elan" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_elan"

  install -Dm644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/elan-lean"
}
