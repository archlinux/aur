# Maintainer: zapp-brannigan

_pkgname=radiotray-py
pkgname=${_pkgname}-git
pkgrel=1
pkgver=r37.92fa93d
pkgdesc="An Internet radio player written in Python using mpv player"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/CHJ85/Radiotray-py.git"
license=('MIT')
depends=('mpv' 'python-pillow' 'python-pyqt5' 'python-requests')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=("${_pkgname}::git+https://github.com/CHJ85/Radiotray-py.git"
        'radiotray-py.desktop')
sha256sums=('SKIP'
            'aeaf951cf4e3fd16db5ac5df30ee201846183e48e70be1c0537d80dd9f3fd3eb')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ../radiotray-py.desktop "${pkgdir}/usr/share/applications/radiotray-py.desktop"
    install -Dm755 radiotray.py "${pkgdir}/usr/bin/radiotray-py"
}
