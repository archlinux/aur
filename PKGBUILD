# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=run-or-raise
pkgname="gnome-shell-extension-${_pkgname}"
pkgver=44
pkgrel=1
pkgdesc='Launch or focus the window or define custom shortcuts in a text file'
arch=('any')
url="https://github.com/CZ-NIC/${_pkgname}"
license=('GPLv3')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('004ac1ae852b307002dad400d3b35338137fe795ebb819ce99d1d5656344a902')

package() {
    cd "${_pkgname}-${pkgver}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" *.default *.js *.json
    install -Dm644 -t "${_destdir}/lib" lib/*.js
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
