# Maintainer: Maciej Dems <macdems@gmail.com>

_pkgname=yet-another-spotify-tray
pkgname=${_pkgname}-git
pkgver=1.3.0.0233e2f
pkgrel=1
pkgdesc="Tray icon for Spotify Linux client application"
arch=('x86_64')
url="https://github.com/macdems/${_pkgname}"
license=('MIT')
depends=('qt5-base' 'libx11' 'dbus')
makedepends=('cmake' 'qt5-tools')
source=("git+https://github.com/macdems/${_pkgname}.git")
sha256sums=('SKIP')
provides=('spotify-tray')
conflicts=('spotify-tray')

pkgver() {
    cd "${_pkgname}"
    printf "%s.%s" \
        $(awk '/project\(yet-another-spotify-tray VERSION (\S+)/ { print $3; }' CMakeLists.txt) \
        $(git rev-parse --short HEAD)
}

build() {
    cmake -B build -S ${_pkgname} \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
