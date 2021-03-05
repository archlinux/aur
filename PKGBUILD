# Maintainer: Roshless <pkg@roshless.com>

pkgname=gmni-git
pkgrel=1
pkgver=r139.925d9e3
pkgdesc="A Gemini client"
url="https://git.sr.ht/~sircmpwn/gmni"
arch=("any")
license=("GPL")
source=("gmni::git+https://git.sr.ht/~sircmpwn/gmni")
depends=('bearssl')
makedepends=('git' 'scdoc')

pkgver() {
    cd gmni
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd gmni

    mkdir build && cd build
    # errors? what errors :)
    CFLAGS=-Wno-error ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd gmni/build
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
