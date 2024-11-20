# Maintainer: Chuyan Zhang <me [at] zcy [dot] moe>

pkgbase=nvidia-flip-cuda-git
pkgname=("$pkgbase")
pkgdesc="A Tool for Visualizing and Communicating Errors in Rendered Images - CUDA version"
pkgver="v1.6"
_versionhash="79675788aa642fbb4732effe2b45b082ff4c4d52"
pkgrel=1
epoch=1
url="https://github.com/NVlabs/flip"
arch=('x86_64')
license=("BSD-3-Clause")

source=("$pkgbase::git+$url")
sha256sums=('SKIP')
makedepends=(git)
depends=(cuda)

prepare() {
    cd "$pkgbase"
    git checkout $_versionhash
}

build() {
    cd "$pkgbase/src"

    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DFLIP_ENABLE_CUDA=ON
    cmake --build .
}


package() {
    cd "$pkgbase"
    install -Dm755 "src/build/flip" "$pkgdir/usr/bin/flip-cuda-cli"
}
