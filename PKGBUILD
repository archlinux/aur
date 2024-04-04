# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=musicbee
_pkgver_major=3
_pkgver_minor=5
_pkgver_build=8698
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_build}
pkgrel=3
pkgdesc="Advanced, feature-rich freeware audio player (uses Wine)"
arch=(x86_64)
url=https://getmusicbee.com
license=(custom)
depends=(wine
		winetricks
		lib32-libpulse
		wine-mono
		bash)
makedepends=(p7zip)
source=("https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/multimedia/MusicBeePortable_3_5.zip"
		"${pkgname}.desktop"
		"${pkgname}.sh"
		"https://www.un4seen.com/files/z/2/bass_aac24.zip") #M4A/AAC Support
sha256sums=('a1da2ff921922fe4323f062a0032b6182b5dd000d6b5df34998614377aa3977a'
            '42e9670e70a37837a026df7d1f3aa89b5247a09927a15204f8dcc95a551b5fab'
            '28b4fcee5f7e88dfa8a8b3846a085167d475bd7c7da4680a8009da792addffd5'
            '782ec4f3758fc715d29ceab332103266df4000dd413a477901dccb8c9bac2090')

package() {
	install -d -m755 ${pkgdir}/usr/share/$pkgname

	cd ${srcdir}
	7z x MusicBeePortable_3_5.exe -o$pkgname -y

	rm -r $pkgname/*PLUGINSDIR

	cp -ra "$srcdir/$pkgname/"* "${pkgdir}/usr/share/${pkgname}"
	cp -ra "$srcdir/bass_aac.dll" "${pkgdir}/usr/share/${pkgname}/"

	find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
	find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
	
	install -Dm644 ${pkgdir}/usr/share/$pkgname/License.rtf ${pkgdir}/usr/share/licenses/$pkgname/License.rtf
	rm ${pkgdir}/usr/share/$pkgname/License.rtf

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
