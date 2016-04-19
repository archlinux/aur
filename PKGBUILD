# Maintainer: lol <lol@lol.com>

pkgname="cryptocat-bin"
_pkgname="cryptocat-bin"
pkgver="3.1.03"
pkgrel="2"
pkgdesc="Chat with your friends, privately."
arch=("x86_64")
url="https://crypto.cat/"
license=("GPL3")
depends=("alsa-lib" "desktop-file-utils" "gconf" "gtk2" "libnotify" "nss" "python" "ttf-font")
conflicts=("cryptocat")
options=("!strip")

sha256sums=("e57b6f09459a5ddb96986a34610ad19c8110da05ccd7ac26faf2ab8df36e1373"
'SKIP')

source=("https://cryptocat.blob.core.windows.net/release/Cryptocat-linux-x64.zip"
	"Cryptocat.desktop")


package() {

	cd "${srcdir}"
	unzip Cryptocat.zip
	cd "Cryptocat-linux-x64"

	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"

	# Program
	install -Dm755 "Cryptocat" "${pkgdir}/usr/share/${_pkgname}/Cryptocat"
	install -Dm644 {content_shell.pak,icudtl.dat,libffmpeg.so,LICENSES.chromium.html,libnode.so,natives_blob.bin,snapshot_blob.bin,version} "${pkgdir}/usr/share/${_pkgname}/"

	# Directories
	cp -a {locales,resources} "${pkgdir}/usr/share/${_pkgname}/"

	# Link to program
	ln -s "/usr/share/${_pkgname}/Cryptocat" "${pkgdir}/usr/bin/Cryptocat"

	# Desktop file
	install -Dm644 "${srcdir}/Cryptocat.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon
	install -Dm644 "logo.png" "${pkgdir}/usr/share/pixmaps/Cryptocat.png"

}
