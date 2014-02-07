# Maintainer: J0k3r <moebius282 e4at gmail D0_T com>

pkgname=kairo
pkgver=2.1
pkgrel=1
pkgdesc="A game about exploring the lost world of Kairo"
url="http://kairo.lockeddoorpuzzle.com/"
license=('unknown')
# On their website: 
# > Legal Notice: Kairo is a commercial game and by purchasing it or downloading the demo you are legally bound not to 
# > redistribute the game without our consent. However you are more than welcome to use screenshots and videos from Kairo
# > for whatever purpose you see fit. Including, but not limited to, YouTube videos or TwitchTV streaming.
arch=('i686' 'x86_64')
groups=("games")
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-glu' 'lib32-gcc-libs' 'lib32-libxcursor')
else
	depends=('glu' 'gcc-libs' 'libxcursor')
fi
makedepends=('imagemagick')
changelog="${pkgname}.changelog"
_archivename="${pkgname}-linux-${pkgver}.tar.gz"
source=("file://${_archivename}"
		"${pkgname}.desktop"
		"${pkgname}.changelog")
sha256sums=('c91cec58b194ad009afe27653fcab648fa5e7cd5c0bf037489a0f5c8c796b77b'
            'd3e938b20997c6a26ad9102d56a74d943b35ce47ff155e705a4464f79ca76813'
            '356dbb435640c73a55f6f00521c1033064fa41de995f664378eaa5e238a6c269')
PKGEXT=".pkg.tar"

DLAGENTS+=('file::/usr/bin/echo "Could not find file \"%u\" "')

package()
{
	install -d	"${pkgdir}/opt/" \
				"${pkgdir}/usr/share/pixmaps/" \
				"${pkgdir}/usr/bin/"
	
	cp -r "${srcdir}/Linux/" "${pkgdir}/opt/${pkgname}/"

# I hate these files..
	rm "${pkgdir}/opt/${pkgname}/.DS_Store"

	ln -s "/opt/${pkgname}/Kairo" "${pkgdir}/usr/bin/${pkgname}"

	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${pkgdir}/opt/${pkgname}/${pkgname^}_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}