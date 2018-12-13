# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lc0-cudnn-git
_pkgname=lc0-cudnn
pkgver=855
pkgrel=1
pkgdesc="CudNN version of Leela Chess Zero."
arch=('i686' 'x86_64')
url="https://lczero.org/"
license=('GPLv3')
depends=('cuda' 'cudnn')
makedepends=('git' 'meson>=0.46' 'ninja')
source=("${_pkgname}::git+https://github.com/LeelaChessZero/lc0.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_pkgname}"
    PATH=$PATH:/opt/cuda/bin ./build.sh release -Dblas=false -Dopencl=false || return 1
}

package() {
    cd "$srcdir/$_pkgname/build/release"
    install -Dm755 lc0 $pkgdir/usr/bin/lc0
}
