# Maintainer: David Bittner <bittneradave@gmail.com>
_pkgname=screens
pkgname="${_pkgname}-git"
pkgver=200718
pkgrel=4
pkgdesc="A utility for taking and managing screenshots."
arch=('any')
url="https://www.gitlab.com/DavidBittner/screens"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'libpng' 'libx11' 'curl' 'gstreamermm' 'glibmm')
makedepends=('cmake' 'pkg-config' 'git')
md5sums=("SKIP")
provides=('screens')
conflicts=('screens')
install=
changelog=
source=("${_pkgname}::git+${url}.git")

prepare() {
    mkdir -p "${_pkgname}/build"
    mkdir -p "${_pkgname}/install"
}

build() {
    cd "${_pkgname}"
    git submodule init
    git submodule update
    cmake .
    make
}

package() {
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/bin/"
    cd       "${_pkgname}"

    make DESTDIR="${pkgdir}" install

    install assets/screens.desktop "${pkgdir}/usr/share/applications"
}
