# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_gecko_id="{59812185-ea92-4cca-8ab7-cfcacee81281}"
_name="10ten-ja-reader"
pkgname=firefox-extension-rikaichamp
pkgver=1.5.0
pkgrel=1
pkgdesc="Translate Japanese by hovering over words"
arch=('any')
url="https://github.com/birchill/${_name}"
license=('GPL3')
groups=("firefox-addons")
depends=("firefox")
makedepends=("yarn" "nodejs>=12")
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e0565b48d19eac861bed64f76288fe34206efaa4e10348b201f6a4c8e37fffe')


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
