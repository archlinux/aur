# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=mise-bin
pkgver=2024.0.0
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/mise'
license=('MIT')
provides=('mise')
conflicts=('mise')
options=('!lto')
source=("mise-$pkgver.tar.gz::https://github.com/jdx/mise/releases/download/v2024.0.0/mise-v2024.0.0-linux-x64.tar.gz")
sha512sums=('aa36f0c91613a8790f04928f01f2d483086923bc085493efb268706d15ef857a10d081f9f0b5c8b32dc1a77a84c9c0e054045ed7a02bd422a86f3937e57dacf8')

build() {
  cd "$srcdir/"
  mise/bin/mise completions bash > mise.bash
  mise/bin/mise completions fish > mise.fish
  mise/bin/mise completions zsh > _mise
}

package() {
  cd "$srcdir/"
  install -Dm755 mise/bin/mise "$pkgdir/usr/bin/mise"
  install -Dm644 mise/man/man1/mise.1 "$pkgdir/usr/share/man/man1/mise.1"
  install -Dm644 mise.bash "$pkgdir/usr/share/bash-completion/completions/mise"
  install -Dm644 mise.fish "$pkgdir/usr/share/fish/completions/mise.fish"
  install -Dm644 _mise "$pkgdir/usr/share/zsh/site-functions/_mise"
}

check() {
    "$srcdir/mise/bin/mise" --version
}
