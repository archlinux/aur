# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lc0-cudnn-git
_pkgname=lc0-cudnn
pkgver=955
pkgrel=1
pkgdesc="CudNN version of Leela Chess Zero."
arch=('i686' 'x86_64')
url="https://lczero.org/"
license=('GPLv3')
depends=('cuda' 'cudnn')
makedepends=('git' 'gcc6' 'cmake')
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
    ls
    install -Dm755 lc0 $pkgdir/usr/bin/lc0
}
