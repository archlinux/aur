# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=2023.12.33
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdx/rtx/releases/download/v2023.12.33/rtx-v2023.12.33-linux-x64.tar.gz")
sha512sums=('bde92529b9bb591ba95e09062c22f91a79eea2364ad4add55932395955f4607d82555e0d2cc54b43621d9e666d9cca4c8c1b469b9f2341c2abebee529c6d2edb')

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
