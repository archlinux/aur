# Maintainer: David Cooper <david@dtcooper.com>
# Contributer: Ajay <dev@ajay.app>

_pkgname=bypass-paywalls-chrome-clean
_archivename="${_pkgname}-master"
_source="https://github.com/bpc-clone/bpc_updates/releases/download/latest/${_archivename}.zip"
pkgname=chromium-bypass-paywalls-clean
pkgver=3.7.4.0
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
url="https://github.com/bpc-clone/bpc_updates"
arch=('any')
install="${pkgname}.install"
license=(MIT)
makedepends=(jq)
# You'll need remove existing source files to get an update
source=("${_pkgname}-${pkgver}.zip::${_source}")
# Since upstream changes without notice, skip checksum. We trust github over https, right? :P
sha256sums=('SKIP')

pkgver() {
    jq -r .version < "${_archivename}/manifest.json"
}

package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${_pkgname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${_archivename}"/* "${pkgdir}/usr/share/chromium/${_pkgname}/"
    install -D "${_archivename}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
