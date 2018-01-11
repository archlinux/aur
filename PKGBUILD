# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch-alpha-git
pkgrel=1
pkgver=1.0.0.eb5d366706bea59c687bf892fc88293da823dd90
epoch=
pkgdesc="A utility to that uses Docker to build stateless Arch images that can be booted bare-metal."
arch=('x86_64')
url="https://github.com/pauldotknopf/darch"
license=('MIT')
groups=()
depends=('docker')
makedepends=('jq go')
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
    rm "$srcdir/darch/gitversion"
    cp "$startdir/gitversion" "$srcdir/darch/gitversion"
    local git_sha=`git --git-dir $srcdir/darch/.git rev-parse HEAD`
    echo "1.0.0.$git_sha"
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
