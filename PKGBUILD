# Maintainer: Aiden Langley <aiden at nedia.dev>

pkgname='nedots'
pkgdesc='A dotfile management tool'
url='https://git.sr.ht/~nedia/nedots'
arch=('any')
license=('MIT')
pkgver=1.0.1
pkgrel=3
source=('nedots-v1.0.1.tar.gz::https://git.sr.ht/~nedia/nedots/archive/v1.0.1.tar.gz')
makedepends=('go')
provides=('nedots')

build() {
  cd nedots-v1.0.1 || return
  go build -o nedots .
  ./nedots completion bash >nedots-completions.bash
  ./nedots completion zsh  >nedots-completions.zsh
  ./nedots completion fish >nedots-completions.fish
}

package() {
  cd nedots-v1.0.1 || return
  install -Dm 755 nedots -t "$pkgdir"/usr/bin
  install -Dm 644 nedots-completions.bash "$pkgdir"/usr/share/bash-completion/completions/nedots
  install -Dm 644 nedots-completions.zsh  "$pkgdir"/usr/share/zsh/site-functions/_nedots
  install -Dm 644 nedots-completions.fish "$pkgdir"/usr/share/fish/vendor_completions.d/nedots.fish
}

sha256sums=('424368451bed78660751d27f42da4bc1eafabc5af322dfb34abc113d8a05e3fe')
