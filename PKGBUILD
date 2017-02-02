# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute-git
_pkgname="${pkgname%-git}"
pkgver=0.5.2.r20.g9a97fc1
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/raoulh/${_pkgname}"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libusb'
         'qt5-base'
         'qt5-websockets')

makedepends=('git'
             'make')
checkdepends=()
optdepends=()

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/beta.//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

        mkdir build
        cd build/

        qmake-qt5 ../Moolticute.pro                     \
                  PREFIX=/usr                           \
                  QMAKE_CFLAGS_RELEASE="${CFLAGS}"      \
                  QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"

        make
}

package() {
	cd "${srcdir}/${_pkgname}/build/"

	make INSTALL_ROOT="${pkgdir}/" install
}
