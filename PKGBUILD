# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.35.5
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.35.5/rtx-v1.35.5-linux-x64.tar.gz")
sha512sums=('4427453133a943c9850ad57f7730904fdf0db6e5b1c02259302d09c54b21069cacbe94dcb0dad60b5590483b86d791c99aca649a1131bb04775b5f8c8dcc126b')

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
