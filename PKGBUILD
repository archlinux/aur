# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch-alpha-git
pkgrel=1
pkgver=0.12.0.eb5d366706bea59c687bf892fc88293da823dd90
epoch=
pkgdesc="A utility to that uses Docker to build stateless Arch images that can be booted bare-metal."
arch=('x86_64')
url="https://github.com/pauldotknopf/darch"
license=('MIT')
groups=()
depends=("docker")
makedepends=('docker jq')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("darch::git+https://github.com/pauldotknopf/darch.git#branch=develop")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
    local gitversion_output=`$srcdir/darch/gitversion`
    #echo "$gitversion_output"
    #echo "0.12.0-sdf"
    echo $(echo "$gitversion_output" | jq '.MajorMinorPatch' --raw-output).$(echo "$gitversion_output" | jq '.Sha' --raw-output)
}

build() {
    cd "$srcdir/darch"
    make package
}

package() {
    cd "$srcdir/darch"
    cd bin
    rm darch
    rm *.tar.gz
    cp . -r "$pkgdir"
}
