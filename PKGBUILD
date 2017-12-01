# Maintainer: Max Struebing mxstrbng@gmail.com

pkgname=tldr-go-client-git
pkgver=1.1.0.r3.g5b4ab00
pkgrel=1
pkgdesc="fast TLDR client written in Golang"
arch=(any)
url="https://github.com/mstruebing/tldr"
license=('MIT')
depends=()
makedepends=('git' 'go')
optdepends=('bash-completion: bash completion out of the box')
source=("git+$url")
md5sums=('SKIP')
provides=('tldr')

pkgver() {
    cd "$srcdir/tldr" 
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
    cd "$srcdir/tldr" 
    go get -u github.com/mstruebing/tldr
    make build
}

package() {
    cd "$srcdir/tldr/bin" 
    install -Dm755 tldr "$pkgdir/usr/bin/tldr"
    cd "$srcdir/tldr" 
    install -Dm644 autocompletion/autocomplete.zsh "${pkgdir}/usr/share/zsh/site-functions/_tldr"
    install -Dm644 autocompletion/autocomplete.bash "${pkgdir}/usr/share/bash-completion/completions/tldr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/tldr/LICENSE"
}
