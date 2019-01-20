_pkgname=weidu
pkgname=$_pkgname-git
pkgver=git
pkgrel=1

makedepends=("ocaml" "elkhound-git")
arch=("x86_64")

conflicts=("weidu-bin" "weidu")

url="https://github.com/WeiDUorg/weidu"
pkgdesc="WeiDU is a program used to develop, distribute and install modifications for games based on the Infinity Engine."

license=("GPLv2")

source=("git+https://github.com/WeiDUorg/weidu#branch=devel")

sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/weidu"
    git describe --always | sed "s|-|.|g"
}

prepare() {
    cd "$srcdir/weidu"
    cp sample.Configuration Configuration
}

build() {

    cd "$srcdir/weidu" 
    make -j1
}

package() {
    cd "$srcdir/weidu"
    install -D -m=0755 weidu.asm.exe "$pkgdir/usr/bin/weidu"
}


