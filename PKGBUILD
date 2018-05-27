# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lczero-nvidia-git
_pkgname=leela-chess
pkgver=0.10
pkgrel=1
pkgdesc="This is an adaptation of GCP's Leela Zero repository to chess, using Stockfish's position representation and move generation."
arch=('i686' 'x86_64')
url="https://github.com/glinscott/leela-chess"
license=('GPLv3')
depends=('glibc' 'zlib' 'libopenblas>=0.3.0' 'boost' 'opencl-nvidia')
makedepends=('git' 'opencl-headers' 'cmake' 'ocl-icd')
source=("${_pkgname}::git+https://github.com/glinscott/leela-chess")
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    git submodule update --init --recursive
    mkdir -p build && cd build
    cmake .. || return 1
	make clean || return 1
	make || return 1
}

check() {
    cd $srcdir/$_pkgname/build
    ./tests
}

package() {
	cd "$srcdir/$_pkgname"
    install -Dm755 build/lczero $pkgdir/usr/bin/lczero
}
