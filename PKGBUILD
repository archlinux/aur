# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=helmup-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Check your helm chart dependencies for updates and apply them with an interactive selection."
arch=('x86_64')
url="https://github.com/rubengees/helmup"
license=('MIT')
source=(https://github.com/rubengees/helmup/releases/download/0.1.5/helmup-0.1.5-linux-amd64 https://raw.githubusercontent.com/rubengees/helmup/0.1.5/LICENSE.txt)
md5sums=(1ca503e6cb64a140d0256020a7f94961 3cedd8b36dadab22d43300fe89a0bf67)

build() {
  chmod +x ./helmup-*
  ./helmup-* completion bash > completion.bash
  ./helmup-* completion fish > completion.fish
  ./helmup-* completion zsh > completion.zsh
}

package() {
  install -Dm755 helmup-* "$pkgdir/usr/bin/helmup"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/helmup"
  install -Dm644 completion.fish "$pkgdir/usr/share/fish/completions/helmup.fish"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_helmup-fmt"
}
