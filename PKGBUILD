# Maintainer: David Cooper <david@dtcooper.com>
# Contributer: Ajay <dev@ajay.app>

_pkgname=bypass-paywalls-chrome-clean
_source="https://github.com/bpc-clone/bpc_updates/releases/download/latest/${_pkgname}-master.zip"
pkgname=chromium-bypass-paywalls-clean
pkgver=20240430162844
pkgrel=1
pkgdesc="Chromium extension to bypass paywalls"
url="https://github.com/bpc-clone/bpc_updates"
arch=('any')
install=$pkgname.install
license=(MIT)
makedepends=(curl)
source=("${_pkgname}-${pkgver}.zip::${_source}")
# Skip, since a newer version may exist upstream. We trust Github, right? :P
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
