_pkgname=phonon-qt6-mpv
pkgname=${_pkgname}-git
pkgdesc='Phonon MPV backend for Qt6 (git)'
pkgver=0.1.0.r0.g069aca4
pkgrel=1
arch=('x86_64')
_repo='phonon-mpv'
url="https://github.com/OpenProgger/${_repo}"
license=('LGPL-2.1-only')
provides=("${_pkgname}" 'phonon-qt6-backend')
conflicts=("${_pkgname}")

depends=('glibc' 'mpv' 'phonon-qt6')
makedepends=('extra-cmake-modules' 'git')

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_repo}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B 'build' -S "${_repo}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DPHONON_BUILD_QT5=OFF \
        -DPHONON_BUILD_QT6=ON

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
