# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.35.8
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.35.8/rtx-v1.35.8-linux-x64.tar.gz")
sha512sums=('2f9a8158f28e52587251e30a00c2419e99fb37a925de17fa0ef59e2728c226525b5e08eb7ed6d53f74d708dafb62bfe557178883b215ade27143a31cb9983952')

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
    install -Dm644 _rtx "$pkgdir/usr/share/zsh/site-functions/_zsh"
}

check() {
    "$srcdir/rtx/bin/rtx" --version
}
