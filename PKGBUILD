# Maintainer: David Cooper <david@dtcooper.com>
# Contributer: Ajay <dev@ajay.app>

_pkgname=bypass-paywalls-chrome-clean
_archivename="${_pkgname}-master"
_source="https://github.com/bpc-clone/bpc_updates/releases/download/latest/${_archivename}.zip"
pkgname=chromium-bypass-paywalls-clean
pkgver=3.7.2.0
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
url="https://github.com/bpc-clone/bpc_updates"
arch=('any')
install=$pkgname.install
license=(MIT)
makedepends=(curl jq)
source=("${_pkgname}-${pkgver}.zip::${_source}")
sha256sums=('2cf2a10738637f364137477dc01c6dbce35ce34b5d395e13df1c874cec036f4c')

pkgver() {
    curl -L "${_source}" | bsdtar -xOf - "${_archivename}/manifest.json" | jq -r .version
}

package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${_pkgname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${_archivename}"/* "${pkgdir}/usr/share/chromium/${_pkgname}/"
    install -D "${_archivename}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
