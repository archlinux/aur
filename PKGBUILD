# Maintainer: Philip 'Chais' Abernethy<chais.z3r0@gmail.com>
pkgname=thebridge
pkgver=1
pkgrel=2
epoch=1410196636
pkgdesc="A 2D logic puzzle game that plays with physics and perspective."
url="http://thebridgeisblackandwhite.com/"
arch=('x86_64' 'i686')
license=('custom:commercial')
depends_i686=('glu' 'libxcursor')
depends_x86_64=('lib32-glu' 'lib32-libxcursor')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://TheBridgeLinux_${epoch}.zip")
sha512sums=('72c6ddee3ecdf6218cc1a10fb83226c4ec504966a13530b5975475f2554cea24bf55849b7b98c3f04512a54e978b5677115a61597585bc4036cc73f1b9a5112c')

# Uncomment for big packages
PKGEXT=".pkg.tar"

package() {
	install -Dm755 "${srcdir}/TheBridgeLinux/TheBridge/TheBridge.x86" "${pkgdir}/opt/${pkgname}/TheBridge.x86"
	pushd "${srcdir}/TheBridgeLinux/TheBridge" > /dev/null
	find -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;
	find TheBridge_Data -type f -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	popd > /dev/null
	install -dm755 "${pkgdir}"/usr/{bin,share/{applications,pixmaps}}
	ln -s /opt/${pkgname}/TheBridge.x86 "${pkgdir}/usr/bin/${pkgname}"
	ln -s /opt/${pkgname}/TheBridge_Data/Resources/UnityPlayer.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	echo "[Desktop Entry]
Type=Application
Name=The Bridge
GenericName=The Bridge
Comment=${pkgdesc}
Icon=${pkgname}
Categories=Game;
Path=/opt/${pkgname}
Exec=/usr/bin/${pkgname}" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
