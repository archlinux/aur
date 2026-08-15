# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=elan-lean-bin
pkgver=4.2.3
pkgrel=1
pkgdesc="Lean version manager"
arch=('aarch64' 'x86_64')
url="https://github.com/leanprover/elan"
license=('Apache-2.0' 'MIT')
provides=("elan-lean=$pkgver")
conflicts=('elan-lean')
source=("https://raw.githubusercontent.com/leanprover/elan/refs/heads/master"/LICENSE-{APACHE,MIT})
source_aarch64=("https://github.com/leanprover/elan/releases/download/v4.2.3/elan-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("https://github.com/leanprover/elan/releases/download/v4.2.3/elan-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_aarch64=('cb69af0803b04157bc30201c29c12fca882bb3ad8b43476b8d2d3064810bc3ac')
sha256sums_x86_64=('df0b2b3a439961ffcbb3985214365ffe40f49bc871df04dff268c7d8e21ca8b2')


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
