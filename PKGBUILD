# Maintainer: Johannes Lange (<firstname>DOT<lastname>ATcern.ch>)
pkgname=cernbox
pkgver=2.3.3_1119.1
pkgrel=1
pkgdesc="Synchronization client for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')
depends=('neon' 'qt5-webkit' 'qtkeychain')
provides=('ocsync' 'cernboxsync')

_repo='http://cernbox.cern.ch/cernbox/doc/Linux/repo/openSUSE_Leap_42.3/x86_64/'
source=(
    ${_repo}cernbox-client-${pkgver/_/-}.x86_64.rpm
    ${_repo}libcernboxsync0-${pkgver/_/-}.x86_64.rpm
)
md5sums=(
    '7ab398b3684c7f353b90325da7d67fa9'
    '6e2c98c67893c370aeb94572b5094a2a'
)

package() {
    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
    cp -r "${srcdir}/opt/ownCloud/cernbox/bin" "${pkgdir}/usr/"
    cp -r "${srcdir}/opt/ownCloud/cernbox/lib64" "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/lib/cernbox/"*.so* "${pkgdir}/usr/lib/"
    rm -r "${pkgdir}/usr/lib/cernbox"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cernbox.png" "${pkgdir}/usr/share/pixmaps"

    cp -dpr "${srcdir}/etc" "${pkgdir}"
}
