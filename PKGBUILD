_pkgname=elkhound
pkgname=$_pkgname-git
pkgver=git
pkgrel=1


arch=("x86_64")

conflicts=("elkhound-bin" "elkhound")

url="https://github.com/WeiDUorg/elkhound"
pkgdesc="Elkhound, née Elsa/Elkhound, as used by WeiDU"

license=("custom")

source=("git+https://github.com/WeiDUorg/elkhound")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/elkhound"
    git describe --always | sed "s|-|.|g"
}

prepare() {
    cd "$srcdir/elkhound/src"
    ./configure
}

build() {
    cd "$srcdir/elkhound/src"
    make -j1
}

package() {
    cd "$srcdir/elkhound/src/elkhound"
    install -D -m=0755 elkhound "$pkgdir/usr/bin/elkhound"
}


