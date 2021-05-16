#
# Maintainer: Antonio Davide Trogu <contact at redasm dot io> 
#

_pkgver=3.0.0-beta5
_pkgname=REDasm

pkgname=redasm-disassembler
pkgver=${_pkgver//-/_}
pkgrel=1
url="https://redasm.io"
arch=("x86_64")
pkgdesc="The Open Source Disassembler (Official Package)"
license=("GPL3")
makedepends=("cmake" "git")
depends=("qt5-base")
conflicts=("redasm-git" "redasm")
source=("git+https://github.com/REDasmOrg/REDasm.git#tag=v${_pkgver}")
md5sums=("SKIP")

prepare() {
    cd ${_pkgname}
    git submodule update --init --recursive
}

build() {
    cd ${_pkgname}
    mkdir -p build
    cd build
    cmake ..
    cmake --build . --config Release
}

package() {
    cd ${_pkgname}/build
    cmake --install . --prefix $pkgdir/usr
}

 
