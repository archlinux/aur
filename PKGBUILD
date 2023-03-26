# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=rlottie
pkgname=rlottie-telegrand-git
pkgver=r860.327fb7d
pkgrel=1
pkgdesc='A platform independent standalone library that plays Lottie Animation (Version required by Telegrand)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/melix99/rlottie'
license=('LGPL-v2.1')
makedepends=('cmake' 'git')
depends=('libpng')
provides=(${_pkgname})
source=("git+$url#branch=fix-build")
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
    install -Dm755 example/lottie2gif "${pkgdir}/usr/bin/lottie2gif"
}

# vim:set ts=8 sts=2 sw=2 et:
