# Maintainer: Johannes Lange (<firstname>DOT<lastname>ATcern.ch>)
pkgname=cernbox
pkgver=2.1.1_1.1
pkgrel=2
pkgdesc="Synchronization client for CERN's CERNBox cloud service (based on ownCloud). Note: CERN IT does not provide official support for Arch Linux. Use at your own risk."
arch=('x86_64')
url="http://cernbox.web.cern.ch/"
license=('GPL')
depends=('neon' 'qt5-webkit')
provides=('ocsync' 'cernboxsync')

_repo='http://cernbox.cern.ch/cernbox/doc/Linux/repo/openSUSE_13.2/x86_64/'
source=(
    ${_repo}cernbox-client-${pkgver/_/-}.x86_64.rpm
    ${_repo}libcernboxsync0-${pkgver/_/-}.x86_64.rpm
    ${_repo}libqt5keychain0-0.5-3.1.x86_64.rpm
    cernbox
    cernboxcmd
)
md5sums=(
    'dc1ec5cf677831dcadd019ce5e88516c'
    '743d03f22dcf357112590adbfc120306'
    '54e5726b228dde3b1593d357607861c3'
    '911d014c0670d3bf7cbc622f00206339'
    '83a60fef4c5f69b2ed91605db490a955'
)

package() {
    cp -dpr "${srcdir}/usr" "${pkgdir}"
    cp -dpr "${srcdir}/etc" "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp "${pkgdir}/usr/share/icons/hicolor/128x128/apps/cernbox.png" "${pkgdir}/usr/share/pixmaps"
    if [ "$CARCH" = "x86_64" ]; then
        mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
    fi
    mv "${pkgdir}/usr/bin/cernbox" "${pkgdir}/usr/lib/cernbox/"
    mv "${pkgdir}/usr/bin/cernboxcmd" "${pkgdir}/usr/lib/cernbox/"
    mv "${pkgdir}/usr/lib/libqt5keychain.so.0" "${pkgdir}/usr/lib/cernbox/"
    mv "${pkgdir}/usr/lib/libqt5keychain.so.0.5.0" "${pkgdir}/usr/lib/cernbox/"
    # wrapper scripts
    cp -p "${srcdir}/cernbox" "${pkgdir}/usr/bin"
    cp -p "${srcdir}/cernboxcmd" "${pkgdir}/usr/bin"
    chmod 755 "${pkgdir}/usr/bin/cernbox"
    chmod 755 "${pkgdir}/usr/bin/cernboxcmd"
}
