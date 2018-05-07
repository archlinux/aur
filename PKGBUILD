# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lc0-cudnn-git
_pkgname=lc0-cudnn
pkgver=955
pkgrel=1
pkgdesc="CudNN version of Leela Chess Zero."
arch=('i686' 'x86_64')
url="https://lczero.org/"
license=('GPLv3')
depends=('cuda' 'cudnn' 'boost')
makedepends=('git' 'gcc6' 'cmake' 'gtest')
source=("${_pkgname}::git+https://github.com/glinscott/leela-chess#branch=lc0/cmake")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd ${srcdir}/${_pkgname}/lc0
    CC=gcc-6 CXX=g++-6 ./build.sh || return 1
}

package() {
	cd "$srcdir/$_pkgname/lc0/build/src"
    install -Dm755 lc0 $pkgdir/usr/bin/lc0
	cd "$srcdir/$_pkgname/lc0/build/src/selfplay"
    install -Dm644 libselfplay.so $pkgdir/usr/lib/libselfplay.so
	cd "$srcdir/$_pkgname/lc0/build/src/mcts"
    install -Dm644 libmcts.so $pkgdir/usr/lib/libmcts.so
	cd "$srcdir/$_pkgname/lc0/build/src/chess"
    install -Dm644 libchess.so $pkgdir/usr/lib/libchess.so
	cd "$srcdir/$_pkgname/lc0/build/src/neural"
    install -Dm644 libneural.so $pkgdir/usr/lib/libneural.so
	cd "$srcdir/$_pkgname/lc0/build/src/utils"
    install -Dm644 libutils.so $pkgdir/usr/lib/libutils.so
	cd "$srcdir/$_pkgname/lc0/build/src/neural/cuda"
    install -Dm644 libneural_cudnn.so $pkgdir/usr/lib/libneural_cudnn.so
}
