# Maintainer: Aiden Langley <aiden at nedia.dev>

pkgname='nedots'
pkgdesc='A dotfile management tool'
url='https://git.sr.ht/~nedia/nedots.go'
arch=('any')
license=('MIT')
pkgver=1.0.0
pkgrel=1
source=('nedots.go-v1.0.0.tar.gz::https://git.sr.ht/~nedia/nedots.go/archive/v1.0.0.tar.gz')
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

sha256sums=('cd654aff8780ad9679c6687b6ee286258ab782eb94ba6ebb32905f320e22e619')
