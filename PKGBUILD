# Maintainer: Aiden Langley <aiden at nedia.dev>

pkgname='nedots'
pkgdesc='A dotfile management tool'
url='https://github.com/aidenlangley/nedots.go'
arch=('any')
license=('MIT')
pkgver=0.1.1
pkgrel=1
source=('nedots.go-v0.1.1.tar.gz::https://github.com/aidenlangley/nedots.go/archive/refs/tags/v0.1.1.tar.gz')
makedepends=('go')
provides=('nedots')

build() {
  cd nedots.go-0.1.1 || return
  go -C src build -buildvcs=false -o ../nedots .

  ./nedots completion bash >nedots-completions.bash
  ./nedots completion zsh  >nedots-completions.zsh
  ./nedots completion fish >nedots-completions.fish
}

package() {
  cd nedots.go-0.1.1 || return
  install -Dm 755 nedots -t \"\"/usr/bin
  install -Dm 644 nedots-completions.bash \"\"/usr/share/bash-completion/completions/nedots
  install -Dm 644 nedots-completions.zsh  \"\"/usr/share/zsh/site-functions/_nedots
  install -Dm 644 nedots-completions.fish \"\"/usr/share/fish/vendor_completions.d/nedots.fish
}

sha256sums=('06e503ec731a337d352e9ccc97f39cda0de84038a2689f6bf91e405440dd8b67')
