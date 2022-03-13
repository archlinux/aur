# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
pkgname="simplex-chat-git"
pkgver=v1.3.1.r34.g22ff17ae
pkgrel=1
pkgdesc='a 100% private-by-design chat platform'
arch=("x86_64")
url="https://github.com/simplex-chat/simplex-chat"
license=('AGPL3')
groups=()
makedepends=('stack' 'git')
provides=('simplex-chat')
conflicts=('simplex-chat')
source=('git+https://github.com/simplex-chat/simplex-chat.git#branch=stable')
md5sums=('SKIP')

builddir="${pkgname/-git/}"
build() {
    cd "$builddir"
    rm -rf .stack-work
    stack build
}

pkgver(){
    cd "$builddir"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$builddir"
    stack install --local-bin-path "$pkgdir"/usr/bin
}
