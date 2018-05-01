# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Arc-X-Icons"
pkgname="arc-x-icon-theme"
pkgver=2.1
pkgrel=1
pkgdesc="Modern free desktop icon theme whose design is based around the\
 use of bold colours and simple geometric shapes to compose icons with\
 pixel perfect rendering."
url="https://github.com/LinxGem33/Arc-X-Icons"
arch=('any')
license=('GPL3' 'CC-BY-SA-4.0')
depends=('gtk-update-icon-cache' 'paper-icon-theme')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LinxGem33/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0f8f1c381f42b27c13a1489e23d530f47bc8fe57a6a76741247d2d5320f2d8b0')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -i 's|Name=Arc|Name=Arc-X-D|' "src/Arc-OSX-D/index.theme"
    sed -i 's|Name=Arc|Name=Arc-X-P|' "src/Arc-OSX-P/index.theme"
    mv "src/Arc-OSX-D" "src/Arc-X-D"
    mv "src/Arc-OSX-P" "src/Arc-X-P"
    rm -rf "src/Paper"*
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -d ${pkgdir}/usr/share/{icons,licenses/${pkgname}}
    cp -a src/* "${pkgdir}/usr/share/icons/"
    install -D -m644 ./{LICENSE,COPYING} "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
