# Maintainer: Max Struebing mxstrbng@gmail.com

pkgname=tldr-go-client-git
pkgver=1.1.3
pkgrel=1
pkgdesc="fast TLDR client written in Golang"
arch=(any)
url="https://github.com/mstruebing/tldr"
license=('MIT')
depends=()
makedepends=('git' 'make' 'go')
optdepends=('bash-completion: bash completion out of the box')
source=("git+$url")
md5sums=('SKIP')
provides=('tldr')

build() {
    cd "$srcdir/$(basename $url)" 
    make build
}

package() {
    cd "$srcdir/$(basename $url)/bin" 
    install -Dm755 tldr "$pkgdir/usr/bin/tldr"
    cd "$srcdir/$(basename $url)/autocompletion" 
    install -Dm644 autocomplete.zsh "${pkgdir}/usr/share/zsh/site-functions/_tldr"
    install -Dm644 autocomplete.bash "${pkgdir}/usr/share/bash-completion/tldr"
}
