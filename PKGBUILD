# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=kairo
_datever="01022014"
pkgver=20140102
pkgrel=1
epoch=1
pkgdesc="A game about exploring the lost world of Kairo"
url="http://kairo.lockeddoorpuzzle.com/"
license=('custom')
arch=('i686' 'x86_64')
groups=("games")
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-glu' 'lib32-gcc-libs' 'lib32-libxcursor' 'lib32-gtk2')
else
	depends=('glu' 'gcc-libs' 'libxcursor' 'gtk2')
fi
changelog="${pkgname}.changelog"
_archivename="${pkgname}_linux_${_datever}.gz" # it's a tar.gz.. experts
source=("file://${_archivename}"
		"${pkgname}.desktop"
		"${pkgname}.changelog"
		"${pkgname}.license")
sha256sums=('87f2bd4946a4c2525c02a300e76865b15058f334b76cbf6326b433d7002175d8'
            '3e3c8e4a6387fbebf8840219ccadbdf6a06febf2524c2dc50a239750b6a6c267'
            'b785da983359c325b1d6c1e4e16626f3c5dd4596f50432b0b353c0645448d751'
            '9acb1f5ff635ee1815322a4fe43b9ddc2a2a6f5fb74e35fa8d1494807b24a80c')
PKGEXT='.pkg.tar'

DLAGENTS+=('file::/usr/bin/echo "Could not find file \"%u\" "')

package()
{
	install -d "${pkgdir}/opt/${pkgname}/"
	mv -t "${pkgdir}/opt/${pkgname}/" Kairo KairoReleaseNotes.txt Kairo_Data/

	install -d "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/${pkgname^}" "${pkgdir}/usr/bin/${pkgname}"

	install -D -m644 "${pkgdir}/opt/${pkgname}/${pkgname^}_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
