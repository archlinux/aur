# Maintainer: David Cooper <david@dtcooper.com>
# Contributer: Ajay <dev@ajay.app>

_pkgname=bypass-paywalls-chrome-clean
_archivename="${_pkgname}-master"
_source="https://github.com/bpc-clone/bpc_updates/releases/download/latest/${_archivename}.zip"
pkgname=chromium-bypass-paywalls-clean
pkgver=3.7.2.1
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
url="https://github.com/bpc-clone/bpc_updates"
arch=('any')
install=$pkgname.install
license=(MIT)
makedepends=(curl jq)
source=("${_pkgname}-${pkgver}.zip::${_source}")
sha256sums=('06786b8331698b55d44b6d69ae9c9529e9709a50e2c9bab3d10c1fc86629a7cf')

pkgver() {
    curl -L "${_source}" | bsdtar -xOf - "${_archivename}/manifest.json" | jq -r .version
}

package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${_pkgname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${_archivename}"/* "${pkgdir}/usr/share/chromium/${_pkgname}/"
    install -D "${_archivename}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
