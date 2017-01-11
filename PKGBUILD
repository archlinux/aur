# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
_addon_id=523652
pkgname=firefox-passff
pkgver=0.1.32
pkgrel=3
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/nwallace/passff"
license=('GPL2')
groups=(firefox-addons)
depends=(firefox)
makedepends=(unzip sed)
source=("https://addons.mozilla.org/firefox/downloads/file/${_addon_id}/${_pkgname}-${pkgver}-fx.xpi")
sha256sums=('fd7bb7373b8b0579a327530589b1246fa7648c14c2500c3136a337daa1ba6a5b')

prepare() {
    cd "$srcdir"
    unzip -d "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-fx.xpi"
}

package() {
    cd "$srcdir"

    local ext_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' "${_pkgname}-${pkgver}/install.rdf")"
    install -Dm644 "${_pkgname}-${pkgver}-fx.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/${ext_id}.xpi"
}
