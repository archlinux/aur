# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Arc-OSX-Icons"
pkgname="arc-osx-icon-theme"
pkgver=2.1
pkgrel=1
pkgdesc="Modern free desktop icon theme whose design is based around the\
 use of bold colours and simple geometric shapes to compose icons with\
 pixel perfect rendering."
url="https://github.com/LinxGem33/Arc-OSX-Icons"
arch=('any')
license=('GPL3' 'CC-BY-SA-4.0')
depends=('gtk-update-icon-cache')
provides=("${pkgname}" 'paper-icon-theme')
conflicts=("${pkgname}-git" 'paper-icon-theme')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LinxGem33/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1040128c88ccba167984cac76018bb19ae41684ab467aa8551291a264fa35ba4')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -i 's|Name=Arc|Name=Arc-OSX-D|' "src/Arc-OSX-D/index.theme"
    sed -i 's|Name=Arc|Name=Arc-OSX-P|' "src/Arc-OSX-P/index.theme"
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -d ${pkgdir}/usr/share/{icons,licenses/${pkgname}}
    cp -a src/* "${pkgdir}/usr/share/icons/"
    install -D -m644 ./{LICENSE,COPYING} "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
