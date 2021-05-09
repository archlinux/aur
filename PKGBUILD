# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_gecko_id="jid0-XWJxt5VvCXkKzQK99PhZqAn7Xbg@jetpack"
_name="searchlinkfix"
pkgname=firefox-extension-google-search-link-fix
pkgver=1.6.10
pkgrel=3
pkgdesc="Prevents Google and Yandex search pages from modifying search result links when you click them"
arch=('any')
url="https://github.com/palant/${_name}"
license=('MPL2')
groups=("firefox-addons")
depends=("firefox")
makedepends=("npm" "nodejs>=12")
source=("${url}/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('3ce17e496703191fa2897390285056911b2669230ee8443b65bc64adb65cf855')


build() {
    cd "${_name}-${pkgver}"
    npm install

    node_modules/.bin/gulp xpi
}

package() {
    cd "${_name}-${pkgver}/"
    install -D --mode 644 -- "${_name}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
