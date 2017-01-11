# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
_file_id=502988
pkgname=firefox-passff
pkgver=0.1.32
pkgrel=4
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/nwallace/passff"
license=('GPL2')
groups=(firefox-addons)
depends=(firefox)
makedepends=(unzip sed)
source=("https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_pkgname}-${pkgver}.xpi")
sha256sums=('0d6c2de6765b8db837f4495befbb2d14c7b4a2fb092abcd78c7a6978c1625a2f')

prepare() {
    cd "$srcdir"
    unzip -d "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}.xpi"
}

package() {
    cd "$srcdir"

    local ext_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' "${_pkgname}-${pkgver}/install.rdf")"
    install -Dm644 "${_pkgname}-${pkgver}.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/${ext_id}.xpi"
}
