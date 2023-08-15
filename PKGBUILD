# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=2023.8.0
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v2023.8.0/rtx-v2023.8.0-linux-x64.tar.gz")
sha512sums=('b6c4820795fffce8229f2f913b2dc0a064f7e0918a4dad0edf1c6a69ae2b9b1086edf37b942af3eaceeeb11964e38f2762f5f3b82037ca68dd6476b86459ca66')

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
