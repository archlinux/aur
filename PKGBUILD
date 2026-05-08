# Maintainer: Dmitriy Q atsip-help <at> yandex <dot> ru
pkgname=meshtastic-desktop-bin
pkgver=2.7.14beta3
pkgrel=23
pkgdesc="Meshtastic Desktop Application"
arch=('any')
url="https://github.com/meshtastic/Meshtastic-Android"
license=('GPL3')
depends=('libgcc' 'zlib' 'libmd' 'xdg-utils' 'alsa-lib' 'libbsd' 'libpng' 'util-linux-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/meshtastic/Meshtastic-Android/releases/download/v${pkgver//beta*}-open.3/${pkgname%-bin}_${pkgver//beta*}_amd64.deb")
sha256sums=('ee5f9ece3aae8289374034ac0fb2c3b5af72b6703b3069d7b2982b2e098b178b')

package(){
	bsdtar xzf data.tar.zst -C "${pkgdir}"

	install -d "${pkgdir}/opt/${pkgname%-bin}"
#	ln -s "/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png" "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png"

        #mkdir -p ${pkgdir}/usr/share/applications/
	#sed -i "s|Icon=/opt/${pkgname%-bin}/lib/${pkgname%-bin}.png|Icon=${pkgname%-bin}|g" \
   # "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

	install -D -m644 "${pkgdir}/opt/${pkgname%-bin}/share/doc/copyright" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
        mkdir -p "${pkgdir}/usr/share/applications/"
        install -D "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Meshtastic_Desktop.desktop" "${pkgdir}/usr/share/applications/"
	echo "StartupWMClass=org-${pkgname%-bin}-MainKt" | sudo tee -a /usr/share/applications/${pkgname%-bin}.desktop
}
