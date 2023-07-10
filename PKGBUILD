# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx-bin
pkgver=1.34.0
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
provides=('rtx')
conflicts=('rtx')
options=('!lto')
source=("rtx-$pkgver.tar.gz::https://github.com/jdxcode/rtx/releases/download/v1.34.0/rtx-v1.34.0-linux-x64.tar.gz")
sha512sums=('4e295e0f5b9b8bbd83f2a5768773d7e50a29ab38d089eb38d93d483320a4e998b018deb0a347977494327565f558458d2fac8e58cbd907f8dc3bbaf959d169e6')

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
