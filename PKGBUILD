_pkgname=elkhound
pkgname=$_pkgname-git
pkgver=git
pkgrel=1


arch=("x86_64")

conflicts=("elkhound-bin" "elkhound")

url="https://github.com/WeiDUorg/elkhound"
pkgdesc="Elkhound, née Elsa/Elkhound, as used by WeiDU"
makedepends=("bison" "flex" "ocaml" "cmake")

license=("custom")

source=("git+https://github.com/WeiDUorg/elkhound")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/elkhound"
    git describe --always | sed "s|-|.|g"
}

prepare() {
    cd "$srcdir/elkhound/"

    mkdir -p build

    cd build
    cmake ../src -DCMAKE_BUILD_TYPE=Release \
        -DEXTRAS=OFF \
        -DOCAML=OFF \
        -DBUILD_TESTING=OFF
}

build() {
    cd "$srcdir/elkhound/build"
    make elkhound
}

package() {
    cd "$srcdir/elkhound/build"
    install -D -m=0755 elkhound/elkhound "$pkgdir/usr/bin/elkhound"
}

