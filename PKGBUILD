pkgname=phonon-qt6-mpv
pkgver=0.1.0
pkgrel=2
pkgdesc='Phonon MPV backend for Qt6'
arch=('x86_64')
_repo='phonon-mpv'
url="https://github.com/OpenProgger/${_repo}"
license=('LGPL-2.1-only')
provides=('phonon-qt6-backend')

depends=('glibc' 'mpv' 'phonon-qt6')
makedepends=('extra-cmake-modules')

_snapshot="${_repo}-${pkgver}"
source=("${url}/archive/v${pkgver}/${_snapshot}.tar.gz")
sha256sums=('8cba7d803c23267bf7431bf79c4a65a03c767c01026a0cced18985bfa418a076')

build() {
    cmake -B 'build' -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DPHONON_BUILD_QT5=OFF \
        -DPHONON_BUILD_QT6=ON

    cmake --build 'build'
}

package() {
    DESTDIR="${pkgdir}" cmake --install 'build'
}
