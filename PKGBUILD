# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=elan-lean-bin
pkgver=4.3.0
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
sha256sums_aarch64=('a1a3359c09e2a9f016bd241393ca79ad5f88eb1e4d45bb0215d799f3e55f08a3')
sha256sums_x86_64=('0c71472fa3ac34871dc1e2539993cca222d7656b42a1469f8f8c97c22f9adab2')


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
