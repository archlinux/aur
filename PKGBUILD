# Maintainer: Dmitriy Q atsip-help <at> yandex <dot> ru
pkgname=meshtastic-desktop-bin
pkgver=2.8.3
pkgrel=1
pkgdesc="Meshtastic Desktop Application"
arch=('any')
url="https://github.com/meshtastic/Meshtastic-Android"
license=('GPL3')
depends=('libgcc' 'zlib' 'libmd' 'xdg-utils' 'alsa-lib' 'libbsd' 'libpng' 'util-linux-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
#source=("${url}/releases/download/v${pkgver//beta*}-open.${pkgver#*beta}/${pkgname%-bin}_${pkgver//beta*}_amd64.deb")
sha256sums=('7403dec4d01727fada8902c341222bc22f2440681d62a1c1bb579d585a1235be')

package(){
	bsdtar xzf data.tar.zst -C "${pkgdir}"
        install -d "${pkgdir}/opt/${pkgname%-bin}"
        install -D -m644 "${pkgdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
        mkdir -p "${pkgdir}/usr/share/applications/"
        echo "StartupWMClass=org-${pkgname%-bin}-MainKt" | tee -a "${pkgdir}/opt/meshtastic-desktop/lib/${pkgname%-bin}-Meshtastic_Desktop.desktop"
        install -D "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Meshtastic_Desktop.desktop" "${pkgdir}/usr/share/applications/"
}
