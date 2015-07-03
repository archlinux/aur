# Maintainer: Philip 'Chais' Abernethy<chais.z3r0@gmail.com>
pkgname=racethesun
pkgver=1.441
pkgrel=1
pkgdesc="Hurtle towards the sunset at breakneck speed in a futile race against time."
url="http://flippfly.com/"
arch=('x86_64' 'i686')
license=('custom:commercial')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://RaceTheSunLINUX_${pkgver}.zip")
sha512sums=('e642dc8d4f89949345e552aadb36b448f358dd261cd952c1d059d16010890ef5e10d03b176196c833468dcc1c5b1b50f80930d2e230613d716bbf91e3e791e80')

# Uncomment for big packages
#PKGEXT=".pkg.tar"

package() {
	install -dm755 "${pkgdir}"/{opt/${pkgname},usr/{bin,share/{applications,pixmaps,licenses/${pkgname}}}}
	install -m755 "${srcdir}/RaceTheSunLINUX_${pkgver}/RaceTheSun.x86" "${pkgdir}/opt/${pkgname}/RaceTheSun.x86"
	pushd "${srcdir}/RaceTheSunLINUX_${pkgver}" > /dev/null
	find -type d -exec install -dm755 "${pkgdir}/opt/${pkgname}/{}" \;
	find RaceTheSun_Data -type f -exec install -m644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	popd > /dev/null
	ln -s /opt/${pkgname}/RaceTheSun_Data/Resources/UnityPlayer.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	ln -s /opt/${pkgname}/RaceTheSun.x86 "${pkgdir}/usr/bin/${pkgname}"
	echo "[Desktop Entry]
Type=Application
Version=${pkgver}
Name=Race The Sun
GenericName=Race The Sun
Comment=${pkgdesc}
Icon=${pkgname}
Categories=Game;
Exec=/usr/bin/${pkgname}
Path=/opt/${pkgname}" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
