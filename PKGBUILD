# Maintainer: Claudio Pisa (<firstname>DOT<lastname>ATgarr.it>)
# modified from the cernbox package
pkgname=garrbox
pkgver=2.4.1_2374.1
pkgrel=1
pkgdesc="Synchronization client for GARR's GARRBox cloud service (based on ownCloud). Note: GARR does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://gbox.garr.it/"
license=('GPL')
depends=('neon' 'qt5-webkit' 'qtkeychain')
provides=('ocsync' 'garrboxsync')

_repo='https://gbox.garr.it/repos/Fedora_28/x86_64/'
source=(
    ${_repo}garrbox-client-${pkgver/_/-}.x86_64.rpm
    ${_repo}libgarrboxsync0-${pkgver/_/-}.x86_64.rpm
)
md5sums=(
    '04e7bcb961216b51f1bccca8ac6a3377'
    '6c38e7c952b6a1031c235995427fa055'
)

package() {
    mkdir -p "${pkgdir}/usr"
    cp -dpr "${srcdir}/usr/share" "${pkgdir}/usr/"
    cp -r "${srcdir}/opt/ownCloud/garrbox/bin" "${pkgdir}/usr/"
    cp -r "${srcdir}/opt/ownCloud/garrbox/lib64" "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/lib/garrbox/"*.so* "${pkgdir}/usr/lib/"
    rm -r "${pkgdir}/usr/lib/garrbox"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp "${pkgdir}/usr/share/icons/hicolor/128x128/apps/garrbox.png" "${pkgdir}/usr/share/pixmaps"

    cp -dpr "${srcdir}/etc" "${pkgdir}"
}
