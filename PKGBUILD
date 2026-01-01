# Maintainer: Radon Rosborough <radon@radian.codes>

_pkgname=panel-date-format
pkgname=gnome-shell-extension-panel-date-format
pkgver=22
# Upstream repo does not tag releases, manually determine commit for now
# https://github.com/KEIII/gnome-shell-panel-date-format/issues/28
_pkgsha=a14b59b7d8ec9db3207331d3c063b40fea758228
pkgrel=1
pkgdesc='Allows to customize the date format on the panel'
arch=('any')
url="https://github.com/KEIII/gnome-shell-${_pkgname}"
license=('MIT')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgsha}.tar.gz")
sha256sums=('f9365ad5a0a8e812fab4a4a74539d87f9b0e9766bc10b6420d0a7a47085d23ec')

package() {
    cd "gnome-shell-${_pkgname}-${_pkgsha}"

    local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

    install -Dm644 -t "${_destdir}" metadata.json extension.js icon.svg
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
