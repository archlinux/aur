# Maintainer: xatier
# Contributor: xatier
_pkgname=fcitx5-mcbopomofo
pkgname=fcitx5-mcbopomofo-git
pkgver=197.a972024
pkgrel=1
pkgdesc="McBopomofo for fcitx5"
arch=('x86_64')
url="https://github.com/openvanilla/fcitx5-mcbopomofo"
license=('MIT')
depends=('fcitx5')
makedepends=('cmake' 'extra-cmake-modules' 'git')
optdepends=()
conflicts=('fcitx5-mcbopomofo')
provides=('fcitx5-mcbopomofo')
source=("${_pkgname}::git+https://github.com/openvanilla/fcitx5-mcbopomofo.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make DESTDIR="${pkgdir}" install

    # install licence files
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}/"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
