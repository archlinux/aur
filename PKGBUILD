# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-qodeassist-plugin
pkgname=${_pkgname}-git
pkgver=0.6.0.r11.g4b7eed2
pkgrel=1
pkgdesc="QodeAssist is an AI-powered coding assistant plugin for Qt Creator"
groups=('qt')
arch=('x86_64')
url="https://github.com/Palm1r/QodeAssist"
license=('GPL-3.0-only')
depends=('qtcreator')
makedepends=(
    'git'
    'cmake'
    'qtcreator-devel'
)
provides=("$_pkgname" 'qodeassist' 'QodeAssist')
conflicts=("$_pkgname" 'qodeassist' 'QodeAssist')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S "${_pkgname}" -B build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
