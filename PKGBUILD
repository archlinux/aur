# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname='asmfish-git'
_pkgname=asmfish
pkgver=135
pkgrel=1
pkgdesc="Stockfish translated into assembly language."
arch=('i686' 'x86_64')
url="https://github.com/lantonov/asmFish"
license=('GPL2')
makedepends=('git' 'fasmg')
optdepends=('xboard' 'scid_vs_pc')
provides=('asmfish')
conflicts=('asmfish')
source=("${_pkgname}::git+https://github.com/lantonov/asmFish")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    fasmg "x86/fish.asm" "asmfish" -e 100 -i "VERSION_OS='L'" -i "VERSION_POST = 'popcnt'"
}

check() {
    cd "${srcdir}/${_pkgname}"
    chmod +x ./asmfish
    ./asmfish bench
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 asmfish $pkgdir/usr/bin/asmfish
}
