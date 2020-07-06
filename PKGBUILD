# Maintainer: Andy Kluger <https://t.me/andykluger>

_pkgname=mpvz
_github="Zren/${_pkgname}"
pkgname=${_pkgname}-git
pkgver=0.r147.g1eea404
pkgrel=1
pkgdesc='Qt5/QML based GUI for libmpv. Based on the Tethys theme for Bomi.'
arch=('i686' 'x86_64')
url="https://github.com/${_github}"
license=('GPL2')
makedepends=('git')
depends=('qt5-x11extras' 'qt5-quickcontrols' 'mpv')
source=("${_pkgname}::git://github.com/${_github}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
    printf '0.r%s.g%s' \
        "$(git rev-list --count master)" \
        "$(git log -1 --format='%h')"
}

prepare() {
    mkdir -p "${srcdir}/${_pkgname}/build"
}

build() {
	cd "${srcdir}/${_pkgname}/build"
    qmake ..
    make
}

package() {
	cd "${srcdir}/${_pkgname}/build"
    make INSTALL_ROOT="${pkgdir}/" install
}
