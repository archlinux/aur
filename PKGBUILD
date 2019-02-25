# Maintainer: Severin Kaderli <severin.kaderli@gmail.com>
_pkgname=pegasus-fe
pkgname=${_pkgname}-git
pkgver=alpha10.r135.g038307d
pkgrel=2
pkgdesc="A cross platform, customizable graphical frontend for launching emulators and managing your game collection."
arch=('i686' 'x86_64')
url="http://pegasus-frontend.org/"
license=('GPL3')
makedepends=(
    'git'
    'qt5-tools'
)
depends=(
    'qt-gstreamer'
    'qt5-svg'
    'qt5-multimedia'
    'qt5-gamepad'
    'qt5-graphicaleffects'
)
conflicts=('pegasus-fe')
source=("${_pkgname}::git+https://github.com/mmatyas/pegasus-frontend")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p ./build && cd build
    qmake ..
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "build/src/app/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
