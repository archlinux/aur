# Maintainer: Kisuke <kisuke at kisuke dot cz>

pkgname=jubler
pkgver=5.1
pkgrel=1
pkgdesc='Subtitle editor running on Java'
arch=('any')
url='http://www.jubler.org'
license=('GPL2')
provides=('jubler')
depends=('java-runtime>=8')
optdepends=('mplayer: live video preview for subtitles')
makedepends=('libicns'
						'p7zip')
source=("https://downloads.sourceforge.net/project/jubler/Jubler%20Binary%20Releases/${pkgver}/Jubler-${pkgver}.dmg"
				'jubler.desktop'
				'jubler-subtitles.desktop')
sha256sums=('db061825d731abc2eb96bfbed49df78f712d4b4c58c007d91f608ae670f19438'
						'cb6da5ec3ac11f1a6c4d8becf9105ff88b4966fea9d6796b4dded6019392edfc'
						'62d2a8d048b65bc0a0afe28b14ba006dc82ba91100bfee14185d76c88e18cbc5')
noextract=("Jubler-${pkgver}.dmg")

package() {
	# Install
	cd ${srcdir}
	7z x Jubler-${pkgver}.dmg > /dev/null
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
