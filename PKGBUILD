# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=2023.12.26
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdx/rtx/releases/download/v2023.12.26/rtx-v2023.12.26-linux-x64.tar.gz")
sha512sums=('0c71d0657daded658afccba96e525c52d412cbf886bf8ea1162788a275b2ad5576a4b7c35f66ca68229131fec5b37b8d6a997702d59ae708558936a3e59c0437')

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
