# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=run-or-raise
pkgname="gnome-shell-extension-${_pkgname}"
pkgver=41
pkgrel=1
# Upstream repo does not tag releases, manually determine commit for now
# https://github.com/KEIII/gnome-shell-panel-date-format/issues/28
_pkgsha=35dc593a424de1b4694dc996d4d23b331acc12aa
pkgdesc='Launch or focus the window or define custom shortcuts in a text file'
arch=('any')
url="https://github.com/CZ-NIC/${_pkgname}"
license=('GPLv3')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgsha}.tar.gz")
sha256sums=('de0afa204e80f05a4168db0d856d7ce2f58ffcc176e116ad16a8a0d31f6349a6')

package() {
    cd "${_pkgname}-${_pkgsha}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" *.default *.js *.json
    install -Dm644 -t "${_destdir}/lib" lib/*.js
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
