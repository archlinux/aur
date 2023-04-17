# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_gecko_id="{59812185-ea92-4cca-8ab7-cfcacee81281}"
_name="10ten-ja-reader"
pkgname=firefox-extension-rikaichamp
pkgver=1.13.6
pkgrel=1
pkgdesc="Translate Japanese by hovering over words"
arch=('any')
url="https://github.com/birchill/${_name}"
license=('GPL3')
groups=("firefox-addons")
depends=("firefox")
makedepends=("yarn" "nodejs>=12")
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b0f3109810acc61e8b41d9d79dca48bdbff5572c266e9eaff7014187f9b56ea')


build() {
    cd "${_name}-${pkgver}"

    export RELEASE_BUILD=1
    yarn install --pure-lockfile
    yarn package:firefox
}

check() {
    cd "${_name}-${pkgver}"
    yarn test:unit
}

package() {
    cd "${_name}-${pkgver}"
    install -D --mode 644 -- "dist-firefox-package/10ten_japanese_reader_rikaichamp_-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
