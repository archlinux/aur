# Maintainer: Kisuke <kisuke at kisuke dot cz>

pkgname=jubler-beta
pkgver=6.0
_release='pre6'
_version="${pkgver}.${_release}"
pkgrel=1
pkgdesc='Subtitle editor running on Java'
arch=('any')
url='http://www.jubler.org'
license=('GPL2')
provides=('jubler-beta')
conflicts=('jubler')
depends=('java-runtime>=9')
optdepends=('mplayer: live video preview for subtitles')
makedepends=('libicns'
						'p7zip')
source=("https://github.com/teras/Jubler/releases/download/${_version}/Jubler-${_version}.dmg"
				'jubler.desktop'
				'jubler-subtitles.desktop')
sha256sums=('4c129bae8bfa6af2fb01a2414f7e0f6cefe1c87ea1c129c7b00949a5a2c750a2'
						'c9b4d0bb01c274106576a5030752dcac019d01986ed3b76d706af2dfd6dbd4b5'
						'be21b9eab0992ebd13c9a79ac5e6ab6fd244240fe0e13cd223113ddefffc4ca6')
noextract=("Jubler-${pkgver}.dmg")

package() {
	# Install
	cd ${srcdir}
	7z x Jubler-${_version}.dmg > /dev/null
	mkdir -p ${pkgdir}/usr/share/java/jubler
	cp -R ${srcdir}/Jubler/Jubler.app/Contents/Java/* ${pkgdir}/usr/share/java/jubler/
	find ${pkgdir}/usr/share/java/jubler/* -type d -exec chmod 755 {} +

	# Extract Icons
	icns2png -x ${srcdir}/Jubler/Jubler.app/Contents/Resources/jubler.icns > /dev/null
	install -D -m644 ${srcdir}/jubler_16x16x32.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/jubler.png
	install -D -m644 ${srcdir}/jubler_32x32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/jubler.png
	install -D -m644 ${srcdir}/jubler_48x48x32.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/jubler.png
	install -D -m644 ${srcdir}/jubler_128x128x32.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/jubler.png

	icns2png -x ${srcdir}/Jubler/Jubler.app/Contents/Resources/subtitle.icns > /dev/null
	install -D -m644 ${srcdir}/subtitle_16x16x32.png ${pkgdir}/usr/share/icons/hicolor/16x16/mimetypes/jubler-subtitles.png
	install -D -m644 ${srcdir}/subtitle_32x32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/jubler-subtitles.png
	install -D -m644 ${srcdir}/subtitle_48x48x32.png ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/jubler-subtitles.png
	install -D -m644 ${srcdir}/subtitle_128x128x32.png ${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/jubler-subtitles.png

	install -D -m644 "$srcdir/jubler.desktop" "$pkgdir/usr/share/applications/jubler.desktop"
	install -D -m644 "$srcdir/jubler-subtitles.desktop" "$pkgdir/usr/share/applications/jubler-subtitles.desktop"

}
