# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

_pkgbase=unofficial-homestuck-collection
pkgname="${_pkgbase}-bin"
pkgver=2.0.5
pkgrel=2
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url="https://bambosh.github.io/unofficial-homestuck-collection/"
license=('custom:chrome' 'custom:electron')
depends=('libvips')
makedepends=('gendesk')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!strip')
source=("https://github.com/Bambosh/unofficial-homestuck-collection/releases/download/${pkgver}/unofficial-homestuck-collection-${pkgver}.tar.gz")
sha512sums=('a545e3d31a196ca6a006033b6ec5451eb41d09d1c8f690c35b9f420222e78b9aba960b5ecb7676e993f70c8d779befe50a2d6189fa0f4146ac0da58bd30a4871')

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
