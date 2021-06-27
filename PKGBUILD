# Maintainer: Kamil Śliwak <cameel2@gmail.com>

_gecko_id="{59812185-ea92-4cca-8ab7-cfcacee81281}"
_name="10ten-ja-reader"
pkgname=firefox-extension-rikaichamp
pkgver=0.5.14
pkgrel=2
pkgdesc="Translate Japanese by hovering over words"
arch=('any')
url="https://github.com/birtles/${_name}"
license=('GPL3')
groups=("firefox-addons")
depends=("firefox")
makedepends=("yarn" "nodejs>=12")
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47b831c4a3825ee2b1d754e8694a00f111cd1b65f85f6f4bb908b018c1a07c83')


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
    install -D --mode 644 -- "dist-firefox-package/rikaichamp_japanese_dictionary-${pkgver}.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
