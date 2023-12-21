# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=2023.12.34
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdx/rtx/releases/download/v2023.12.34/rtx-v2023.12.34-linux-x64.tar.gz")
sha512sums=('7d6f205a3e3583dc2edcae23666666552ef3f288680494781f8142fd0bd9b6baecb66fa80ce8817fd62f26034eb88083020b13660a7cd1b4a0f21d080f766ad5')

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
