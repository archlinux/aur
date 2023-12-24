# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=2023.12.36
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdx/rtx/releases/download/v2023.12.36/rtx-v2023.12.36-linux-x64.tar.gz")
sha512sums=('d4fc8cc26eddfb77b28594787a6f657fe1c653f1ef2604a1fe53da7f8cf143907b73f957e2dcf3daae38901591525386faad0390aedae8e481c0d540aaa18031')

build() {
  cd "$srcdir/"
  rtx/bin/rtx completions bash > rtx.bash
  rtx/bin/rtx completions fish > rtx.fish
  rtx/bin/rtx completions zsh > _rtx
}

package() {
  cd "$srcdir/"
  install -Dm755 rtx/bin/rtx "$pkgdir/usr/bin/rtx"
  install -Dm644 rtx/man/man1/rtx.1 "$pkgdir/usr/share/man/man1/rtx.1"
  install -Dm644 rtx.bash "$pkgdir/usr/share/bash-completion/completions/rtx"
  install -Dm644 rtx.fish "$pkgdir/usr/share/fish/completions/rtx.fish"
  install -Dm644 _rtx "$pkgdir/usr/share/zsh/site-functions/_rtx"
}

check() {
    "$srcdir/rtx/bin/rtx" --version
}
