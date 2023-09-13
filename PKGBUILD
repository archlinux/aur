# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=2023.9.1
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdx/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdx/rtx/releases/download/v2023.9.1/rtx-v2023.9.1-linux-x64.tar.gz")
sha512sums=('463414dbc4ed6e15d313e9934197892768a586f57196be68828238b0351be476db103e70c852657cd59d40cd9774791a70e57d1dfd9b67ed875d31a5f565037a')

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
