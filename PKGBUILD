# Maintainer: Chuyan Zhang <me [at] zcy [dot] moe>

pkgbase=nvidia-flip-cpu-git
pkgname=("$pkgbase")
pkgdesc="A Tool for Visualizing and Communicating Errors in Rendered Images - CPU version"
pkgver="v1.7"
_versionhash="b475eb4bf394ab877c42166c9eb0a84a02cc5b14"
pkgrel=1
epoch=1
url="https://github.com/NVlabs/flip"
arch=('x86_64')
license=("BSD-3-Clause")

source=("$pkgbase::git+$url")
sha256sums=('SKIP')
makedepends=(git)

prepare() {
    cd "$pkgbase"
    git checkout $_versionhash
}

build() {
    cd "$pkgbase/src"

    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    cmake --build .
}


package() {
    cd "$pkgbase"
    install -Dm755 "src/build/flip" "$pkgdir/usr/bin/flip-cli"
}
