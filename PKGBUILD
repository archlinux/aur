# Maintainer: Jan Claussen <jan.claussen10 at web dot de>
# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=plecs-standalone
_pkgname="plecs"
pkgver=v5.0.2
_pkgver=$(echo "${pkgver#v}" | sed 's/\./-/g')
pkgrel=1
pkgdesc="A circuit simulation tool written by Plexim (license needed / 30-days free trial)"
url='https://www.plexim.com/de/products/plecs/plecs_standalone'
arch=('x86_64')
license=('custom')
provides=('plecs-standalone')
source=("plecs.desktop"
        "plecs.png"
        "plecs.sh"
        "${pkgname}-${pkgver}-x86_64.tar.gz::https://www.plexim.com/sites/default/files/packages/plecs-standalone-${_pkgver}_linux64.tar.gz")
options=(!strip)

md5sums=('940b5e0762379b8aa80ca01080b7ba0d'
         '8ed62f1ce2de47c761c9244531dc154e'
         '760ba8ecadc6dd64bf7ba6931ef09bc6'
         'a4bf2b8332fcfdcb3bb3ce313964f665')
sha1sums=('9519b03e80377c1dfdb8a42c57852b18ee7ea7ac'
          'e1d9007695acbf40ce55b47f3724c4de8b5ac270'
          'c37634966ec03b461ca1fd5ea3a063511d2b734c'
          '455dab61ebd7f9b68afbed937a49f38a407ac163')

package() {
    # Install icon an desktop file
    install -Dm 664 "${srcdir}/plecs.desktop" "${pkgdir}/usr/share/applications/plecs.desktop"
    install -Dm 644 "${srcdir}/plecs.png" "${pkgdir}/usr/share/pixmaps/plecs.png"

    # Install license
    install -Dm 664 "${srcdir}/plecs/license.txt" "${pkgdir}/usr/share/licenses/plecs/license.txt"

    # Install application
    install -d "${pkgdir}/opt"
    cp -a "${srcdir}/plecs" "${pkgdir}/opt/plecs"

    # Install wrapper start script
    install -Dm 755 ${srcdir}/plecs.sh ${pkgdir}/usr/bin/plecs
}
