# Maintainer: Afnan Enayet <afnan at afnan.io>

pkgname=hdrview-git
provides=('hdrview')
_pkgname=hdrview
pkgver=269.8436cf9
pkgrel=1
pkgdesc='HDRView is a simple research-oriented high-dynamic range image viewer with an emphasis on examining and comparing images, and including minimalistic tonemapping capabilities'
url='https://bitbucket.org/wkjarosz/hdrview'
arch=('x86_64')
license=('BSD')
makedepends=('cmake' 'git')
sha256sums=('SKIP')

source=('git+https://bitbucket.org/wkjarosz/hdrview.git')

pkgver() {
    cd $_pkgname
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_pkgname
    git submodule init
    git submodule update --init --recursive
}

build() {
    cd $_pkgname
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc)
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $_pkgname/build/hdrbatch $pkgdir/usr/bin
    cp $_pkgname/build/HDRView $pkgdir/usr/bin
    cp $_pkgname/build/force-random-dither $pkgdir/usr/bin
}
