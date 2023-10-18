# Maintainer: Aiden Langley <aiden at nedia.dev>

pkgname='nedots'
pkgdesc='A dotfile management tool'
url='https://git.sr.ht/~nedia/nedots.go'
arch=('any')
license=('MIT')
pkgver=0.1.1
pkgrel=1
source=('nedots.go-v0.1.1.tar.gz::https://git.sr.ht/~nedia/nedots.go/archive/v0.1.1.tar.gz')
makedepends=('go')
provides=('nedots')

build() {
  cd "$pkgname"-"$pkgver" || return
  go -C src build -o ../nedots .
  ./nedots completion bash >nedots-completions.bash
  ./nedots completion zsh  >nedots-completions.zsh
  ./nedots completion fish >nedots-completions.fish
}

package() {
  cd "$pkgname"-"$pkgver" || return
  install -Dm 755 nedots -t "$pkgdir"/usr/bin
  install -Dm 644 nedots-completions.bash "$pkgdir"/usr/share/bash-completion/completions/nedots
  install -Dm 644 nedots-completions.zsh  "$pkgdir"/usr/share/zsh/site-functions/_nedots
  install -Dm 644 nedots-completions.fish "$pkgdir"/usr/share/fish/vendor_completions.d/nedots.fish
}

sha256sums=('06e503ec731a337d352e9ccc97f39cda0de84038a2689f6bf91e405440dd8b67')
