# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=2023.12.27
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdx/rtx/releases/download/v2023.12.27/rtx-v2023.12.27-linux-x64.tar.gz")
sha512sums=('a310017ac19b7408e2db3482db27b66d199f145c67f15e606ceda7bc352e313243ff4175e6eef34762ff8c2c821209df1c9925154ebedec2f4f0772de1bc9779')

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
