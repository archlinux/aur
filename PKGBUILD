# Maintainer: David Cooper <david@dtcooper.com>
# Contributer: Ajay <dev@ajay.app>

_pkgname=bypass-paywalls-chrome-clean
_archive="${_pkgname}-master"
pkgname=chromium-bypass-paywalls-clean
pkgver=4.2.5.3
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
url="https://gitflic.ru/project/magnolia1234/bpc_uploads"
_source="${url}/blob/raw?file=${_archive}.zip"
arch=('any')
install="${pkgname}.install"
license=(MIT)
makedepends=(jq)
# You'll need remove existing source files to get an update
source=("${_pkgname}-${pkgver}.zip::${_source}")
# Since upstream changes without notice, skip checksum. We trust gitflic.ru over https, right? :P
sha256sums=('SKIP')

pkgver() {
    jq -r .version < "${_archive}/manifest.json"
}

package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${_pkgname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${_archive}"/* "${pkgdir}/usr/share/chromium/${_pkgname}/"
    install -D "${_archive}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
