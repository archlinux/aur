# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff
pkgver=0.1.32
pkgrel=2
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/nwallace/passff"
license=('GPL2')
groups=(firefox-addons)
depends=(firefox)
makedepends=(unzip sed)
source=("${_pkgname}-${pkgver}.xpi::https://github.com/nwallace/passff/releases/download/${pkgver}/${_pkgname}.xpi")
sha256sums=('e3c36a5a7f05b9be4cc053eace9801863f51f3c9209f17aa68a14693f81d745e')

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
