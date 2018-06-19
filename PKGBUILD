# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Arc-X-Icons"
pkgname="arc-x-icons-theme"
pkgver=2.1
pkgrel=3
pkgdesc="Modern free desktop icon theme whose design is based around the\
 use of bold colours and simple geometric shapes to compose icons with\
 pixel perfect rendering."
url="https://gitlab.com/LinxGem33/Arc-X-Icons"
arch=('any')
license=('GPL3' 'CC-BY-SA-4.0')
depends=('gtk-update-icon-cache' 'paper-icon-theme')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/LinxGem33/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('1fef88f5630ee8d3a900b98e5b080939c1f9143afedcdab99f091307ceb867ad')

prepare() {
    cd "${_pkgname}-v${pkgver}"
    sed -i 's|Name=Arc|Name=Arc-X-D|' "src/Arc-OSX-D/index.theme"
    sed -i 's|Name=Arc|Name=Arc-X-P|' "src/Arc-OSX-P/index.theme"
    rm -rf ./src/Paper*
}

package() {
    cd "${_pkgname}-v${pkgver}"
    install -d ${pkgdir}/usr/share/{icons/Arc-X-D,icons/Arc-X-P,licenses/${pkgname}}
    cp -a src/Arc-OSX-D/* "${pkgdir}/usr/share/icons/Arc-X-D/"
    cp -a src/Arc-OSX-P/* "${pkgdir}/usr/share/icons/Arc-X-P/"
    install -D -m644 ./{LICENSE,COPYING} "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
