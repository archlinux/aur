# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

_pkgbase=unofficial-homestuck-collection
pkgname="${_pkgbase}-bin"
pkgver=1.1.0
pkgrel=2
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url="https://bambosh.github.io/unofficial-homestuck-collection/"
license=('custom:chrome' 'custom:electron')
makedepends=('gendesk')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!strip')
source=("https://github.com/Bambosh/unofficial-homestuck-collection/releases/download/V${pkgver}/unofficial-homestuck-collection-${pkgver}.tar.gz")
sha512sums=('46d1e6ffb3eb02f1b2b9181b105d145007439b78faf7a5849b55b80128c0635752a867f61087600d72a912134a420f164925858dcf85089c4e3b4b857ce6df2e')

prepare() {
    gendesk -f \
        --pkgname="${_pkgbase}" \
        --pkgdesc="${pkgdesc}" \
        --name="Unofficial Homestuck Collection" \
        --categories "Game;" \
        --exec="/usr/bin/unofficial-homestuck-collection"
}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -r "${srcdir}/unofficial-homestuck-collection-${pkgver}/" "${pkgdir}/opt/unofficial-homestuck-collection/"

    mkdir -p "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/"
    ln -s "/opt/unofficial-homestuck-collection/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/LICENSES.chromium.html"
    ln -s "/opt/unofficial-homestuck-collection/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/LICENSE.electron.txt"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/unofficial-homestuck-collection/unofficial-homestuck-collection" \
        "${pkgdir}/usr/bin/unofficial-homestuck-collection"

    mkdir -p "${pkgdir}/usr/share/applications/"
    install -Dm644 "${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
}
