# Maintainer: Kamil Śliwak <cameel2/gmail/com>

_gecko_id="jid1-xUfzOsOFlzSOXg@jetpack"
_name=Reddit-Enhancement-Suite
pkgname=firefox-extension-reddit-enhancement-suite
pkgver=5.22.4
pkgrel=1
pkgdesc="Suite of modules that enhances your Reddit browsing experience"
arch=(any)
url="https://github.com/honestbleeps/${_name}"
license=(GPL3)
groups=(firefox-addons)
depends=(firefox)
makedepends=(yarn)
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6091983f1cb4860d87acef7679bfb4edff87af48de99032381f2a5211d553191')


build() {
    cd "${_name}-${pkgver}"
    yarn install
    yarn build --env browsers=firefox
}

package() {
    cd "${_name}-${pkgver}/"
    install -D --mode 644 -- "dist/zip/firefox.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
