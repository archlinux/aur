# Maintainer: Maxwell Fortney <maxwellfortney@gmail.com>
pkgname=bluebubbles-desktop-app
pkgver=1.0.2
pkgrel=1
pkgdesc="Open source cross-platform iMessage client"
arch=('x86_64')
url="https://bluebubbles.app/"
license=('unknown')
optdepends=('noto-fonts-emoji')
changelog=
sha256sums=('5850b62567f600cb5cbf4d51a094fe385672a4029585a12efdd47d925d22eb25')
source=("$pkgname-$pkgver.deb::https://github.com/BlueBubblesApp/BlueBubbles-Desktop-App/releases/download/$pkgver/$pkgname-$pkgver.deb")

package() {
    #Get the data from the deb
    tar -xvf data.tar.xz 

    # Install the main files.
    install -d "${pkgdir}/opt/BlueBubbles"
    cp -a "./opt/BlueBubbles/." "${pkgdir}/opt/BlueBubbles"

    # Install desktop shortcut and bin
    install -Dm644 "./usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/BlueBubbles/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Create symbolic link to the icon
    install -d "${pkgdir}/usr/share/pixmaps"
    ln -s "/opt/BlueBubbles/resources/resources/icon1024.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Create tray icon to temporarily fix close button bug
    ln -s "/opt/BlueBubbles/resources/resources/icon1024.png" "${pkgdir}/opt/BlueBubbles/resources/resources/67bdc3519553d5530a5ee09ba21f7602.png"
}
