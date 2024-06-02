# Maintainer: David Cooper <david@dtcooper.com>
# Contributer: Ajay <dev@ajay.app>

_pkgname=bypass-paywalls-chrome-clean
_archivename="${_pkgname}-master"
_source="https://github.com/bpc-clone/bpc_updates/releases/download/latest/${_archivename}.zip"
pkgname=chromium-bypass-paywalls-clean
pkgver=3.7.1.0
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
url="https://github.com/bpc-clone/bpc_updates"
arch=('any')
install=$pkgname.install
license=(MIT)
makedepends=(curl jq)
source=("${_pkgname}-${pkgver}.zip::${_source}")
# Skip, since a newer version may exist upstream which overwrites the previous version.
# We trust Github, right? :P
sha256sums=('SKIP')

pkgver() {
    curl -L "${_source}" | bsdtar -xOf - "${_archivename}/manifest.json" | jq -r .version
}

package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${_pkgname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${_archivename}"/* "${pkgdir}/usr/share/chromium/${_pkgname}/"
    install -D "${_archivename}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
