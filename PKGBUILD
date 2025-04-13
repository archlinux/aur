# Maintainer: Kamil Śliwak <cameel2/gmail/com>

_gecko_id="jid1-xUfzOsOFlzSOXg@jetpack"
_name=Reddit-Enhancement-Suite
pkgname=firefox-extension-reddit-enhancement-suite
pkgver=5.24.8
pkgrel=1
pkgdesc="Suite of modules that enhances your Reddit browsing experience"
arch=(any)
url="https://github.com/honestbleeps/${_name}"
license=(GPL3)
groups=(firefox-addons)
depends=(firefox)
makedepends=(yarn 'nodejs<=22')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('242ea904ac2993642cf225aec669f84afb0f99251950cad2bc81c7e0b9888e7d')


build() {
    cd "${_name}-${pkgver}/"
    yarn install --cache-folder "${srcdir}/yarn-cache/"
    yarn run build --browsers=firefox
}

package() {
    cd "${_name}-${pkgver}/"
    install -D --mode 644 -- "dist/zip/firefox.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/${_gecko_id}.xpi"
}
