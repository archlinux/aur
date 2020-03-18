# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=rlottie
pkgname=rlottie-git
pkgver=r747.dcab762
pkgrel=1
pkgdesc='https://github.com/Samsung/rlottie'
arch=('i686' 'x86_64')
url='https://github.com/Samsung/rlottie'
license=('LGPL-v2.1')
makedepends=('cmake' 'git')
depends=('libpng')
provides=(${_pkgname})
source=("git+https://github.com/Samsung/rlottie.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"

    rm -rf build
    mkdir build
}

build() {
    cd "${_pkgname}/build"

    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release || return 1
    make || return 1
}

package() {
    cd "${_pkgname}/build"

    make DESTDIR=${pkgdir} install || return 1
}

# vim:set ts=8 sts=2 sw=2 et:
