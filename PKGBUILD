# Maintainer: Ajay <dev@ajay.app>
# Maintainer: David Cooper <david@dtcooper.com>

_pkgname=bypass-paywalls-chrome-clean
pkgname=chromium-bypass-paywalls-clean-git
pkgver=20240429160549
pkgrel=2
pkgdesc="Chromium extension to bypass paywalls"
arch=('any')
makedepends=(curl)
url="https://github.com/bpc-clone/bpc_updates"
license=(MIT)
_source="https://github.com/bpc-clone/bpc_updates/releases/download/latest/${_pkgname}-master.zip"
source=("${_pkgname}-${pkgver}.zip::${_source}")
sha256sums=('SKIP')

pkgver() {
    date -u --date="$(curl -LsvX HEAD "${_source}" 2>&1 | grep -i '^< Last-Modified:' | cut -f 3- -d ' ')" '+%Y%m%d%H%M%S'
}

package() {
    mkdir -p "${pkgdir}/usr/share/chromium/${_pkgname}"
    shopt -u dotglob
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-master"/* "${pkgdir}/usr/share/chromium/${_pkgname}/"
    install -D "${_pkgname}-master/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
