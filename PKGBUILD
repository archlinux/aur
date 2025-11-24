# Maintainer: XSilverTH <XSilverTH@proton.me>

pkgname=adb-gui-kit-bin
pkgver=1.1
pkgrel=1
pkgdesc="A simple, modern GUI for ADB and Fastboot"
arch=('x86_64')
url="https://github.com/Drenzzz/adb-gui-kit"
license=('custom')
depends=('gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'android-tools')
provides=('adb-gui-kit')
conflicts=('adb-gui-kit')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drenzzz/adb-gui-kit/releases/download/v${pkgver}/ADBKit-${pkgver}.0-linux-standalone.tar.gz"
               "adb-gui-kit.desktop"
               "https://raw.githubusercontent.com/Drenzzz/adb-gui-kit/refs/heads/main/frontend/public/logo.png")

sha256sums_x86_64=('4217c4aa50502d1f0e0f299191a7a977acb00db63907ef69f903a809f74cba0f'
                   'dea69b0a76f5cfdf4d0dce7c9d0a8ce40e814d8dca257941114e987df4427cbf'
                   '30bb96b234bcaaed28edb520d8c2b2759de28bcd83936a1544917465d45583d3')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -d "${pkgdir}/opt/${pkgname}"

    cd "${srcdir}/ADBKit" || cd "${srcdir}" 
    
    install -m755 ADBKit "${pkgdir}/opt/${pkgname}/adb-gui-kit"

    ln -s "/opt/${pkgname}/adb-gui-kit" "${pkgdir}/usr/bin/adb-gui-kit"

    cd "${srcdir}"
    install -m644 adb-gui-kit.desktop "${pkgdir}/usr/share/applications/"
    
    install -m644 logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/adb-gui-kit.png"
}
