# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=run-or-raise
pkgname="gnome-shell-extension-${_pkgname}"
pkgver=49
pkgrel=1
pkgdesc='Launch or focus the window or define custom shortcuts in a text file'
arch=('any')
url="https://github.com/CZ-NIC/${_pkgname}"
license=('GPLv3')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('53c622887eaba38ef6b1a8f162aa61732b8a064f76dd8219d05443ddad0ee5df')

package() {
    cd "${_pkgname}-${pkgver}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" *.default *.js *.json
    install -Dm644 -t "${_destdir}/lib" lib/*.js
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
