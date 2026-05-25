# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=run-or-raise
pkgname="gnome-shell-extension-${_pkgname}"
pkgver=45
pkgrel=1
pkgdesc='Launch or focus the window or define custom shortcuts in a text file'
arch=('any')
url="https://github.com/CZ-NIC/${_pkgname}"
license=('GPLv3')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6767ab2aab4771c9bb528a84e01fa38afc64f86f08088fb2dcda0542a24b2972')

package() {
    cd "${_pkgname}-${pkgver}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" *.default *.js *.json
    install -Dm644 -t "${_destdir}/lib" lib/*.js
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
