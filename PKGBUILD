# Maintainer: Aiden Langley <aiden at nedia.dev>

pkgname='nedots'
pkgdesc='A dotfile management tool'
url='https://git.sr.ht/~nedia/nedots'
arch=('any')
license=('MIT')
pkgver=1.0.2
pkgrel=3
source=('nedots-v1.0.2.tar.gz::https://git.sr.ht/~nedia/nedots/archive/v1.0.2.tar.gz')
makedepends=('go')
provides=('nedots')

build() {
  cd nedots-v1.0.2 || return
  go build -o nedots .
  ./nedots completion bash >nedots.bash
  ./nedots completion zsh  >nedots.zsh
  ./nedots completion fish >nedots.fish
}

package() {
  cd nedots-v1.0.2 || return
  install -Dm 755 nedots -t "$pkgdir"/usr/bin
  install -Dm 644 nedots.bash "$pkgdir"/usr/share/bash-completion/completions/nedots
  install -Dm 644 nedots.zsh  "$pkgdir"/usr/share/zsh/site-functions/_nedots
  install -Dm 644 nedots.fish "$pkgdir"/usr/share/fish/vendor_completions.d/nedots.fish
}

sha256sums=('c3c51caac7a055dee4dfb447b4ebf450ba9ab015cc6bfb797910f3025ac88afa')
