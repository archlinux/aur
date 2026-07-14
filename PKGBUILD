# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=rtrash
pkgver=0.1.4
pkgrel=2
pkgdesc="Fast freedesktop.org trash tool with an rm-compatible interface"
arch=('x86_64')
url='https://github.com/HaoZeke/rtrash'
license=('MIT')
depends=()
# Ships trash / trash-put / ... multi-call names (same paths as trash-cli)
provides=('trash-cli')
conflicts=('trash-cli')
options=('!strip')  # musl static release
source=("$pkgname-$pkgver-x86_64-unknown-linux-musl.tar.gz::https://github.com/HaoZeke/rtrash/releases/download/v$pkgver/rtrash-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('3009dc4d97a5d76bace30f81b17c462f0e5fc8876d409dfcc2d6ebce3931ef6e')

package() {
  cd "$pkgname-$pkgver-x86_64-unknown-linux-musl"
  install -Dm755 bin/rtrash "$pkgdir/usr/bin/rtrash"
  for b in trash trash-put trash-empty trash-list trash-restore trash-rm; do
    install -Dm755 "bin/$b" "$pkgdir/usr/bin/$b"
  done
  if [[ -f share/man/man1/rtrash.1 ]]; then
    install -Dm644 share/man/man1/rtrash.1 "$pkgdir/usr/share/man/man1/rtrash.1"
  fi
  if [[ -d share/bash-completion/completions ]]; then
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -m644 share/bash-completion/completions/* "$pkgdir/usr/share/bash-completion/completions/"
  fi
  if [[ -d share/zsh/site-functions ]]; then
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -m644 share/zsh/site-functions/* "$pkgdir/usr/share/zsh/site-functions/"
  fi
  if [[ -d share/fish/vendor_completions.d ]]; then
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"
    install -m644 share/fish/vendor_completions.d/* "$pkgdir/usr/share/fish/vendor_completions.d/"
  fi
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  echo MIT > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
