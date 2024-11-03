# Maintainer: BrLi <brli-noreply@github.com>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tim Besard <tim.besard@gmail.com>

_pkgname=libqxt
pkgname=libqxt-git
pkgver=0.6.2.1.r151.g38cf3bd
pkgrel=1
pkgdesc='Provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit'
arch=('x86_64')
url='http://www.libqxt.org'
license=('CPL' 'LGPL2.1')
depends=('qt5-base' 'db' 'libssh2')
makedepends=('avahi' 'libxrandr' 'qt5-tools' 'qt5-x11extras' 'qt5-xcb-private-headers')
optdepends=('avahi: Zeroconf support')
provides=(${_pkgname})
conflicts=(${_pkgname})
replacess=(${_pkgname})
options=('!emptydirs')
source=("git+https://github.com/Brli/libqxt.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare(){
    cd "${_pkgname}"
    # use system libssh2
    rm -rfv src/3rdparty/
}

build() {
    cd "${_pkgname}"
    ./configure -qmake-bin '/usr/bin/qmake' \
                -prefix '/usr' \
                -libdir '/usr/lib' \
                -nomake docs -nomake designer \
                -l db -l ssh2  -L /usr/lib
    make
}

package() {
    cd "${_pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
}
