# Maintainer: Oleg Shparber <oleg@zealdocs.org>

_appname=zeal
_builddir=build

pkgname=${_appname}-git
pkgver=0.7.0.r0.g90ad776
pkgrel=2
pkgdesc="A simple documentation browser"
arch=('aarch64' 'i686' 'x86_64')
url="https://zealdocs.org/"
license=('GPL3')
depends=('hicolor-icon-theme' 'libarchive' 'qt6-webengine')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja')
provides=(${_appname})
conflicts=(${_appname})
source=("${_appname}::git+https://github.com/zealdocs/${_appname}#branch=main")
sha1sums=('SKIP')

pkgver() {
    cd ${_appname}
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -G Ninja -B "${_builddir}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        "${srcdir}/${_appname}"

    cmake --build "${_builddir}"
}

package() {
    cmake --install "${_builddir}" --prefix "${pkgdir}/usr"
}
