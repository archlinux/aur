# Maintainer: Nick Haghiri (n s dot hag hiri at G mail dot com)
pkgname=hexcore-link
pkgver=2.5.9
pkgrel=2
pkgdesc="Hexcore Link for ANNE PRO 2D and other keyboards with firmware versions higher than 3.0"
arch=('x86_64')
url="https://www.hexcore.xyz/hexcore-link"
license=(custom)
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'libxkbcommon-x11')
options=('!strip' '!emptydirs')
install=${pkgname}.install

DLAGENTS='https::/usr/bin/curl -qgC - -e https://www.hexcore.xyz/hexcore-link -o %o %u'

source_x86_64=("https://www.hexcore.xyz/releases/software/hexcore-link/linux/tar/HexcoreLink_${pkgver}_x64.tar.gz"
"deb_extra_files_hexcore.tar.gz")
sha256sums_x86_64=('726f2062d2446d2101e6b2eec5e95d186c1a0a15e21ede69e5ff573ec30d24e9'
'94e4942cc7408feb419e76aa2867e50bdf2bedefd734eb367286b5a7844d2c46')


package(){

	# Install the main files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/HexcoreLink_${pkgver}_x64/." "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr"
	cp -a "${srcdir}/usr/." "${pkgdir}/usr"

	# Exec bit
	chmod 755 "${pkgdir}/opt/${pkgname}/hexcore-link"

	# License
	install -D -m644 "${pkgdir}/opt/hexcore-link/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CHROMIUM"

	install -D -m644 "${pkgdir}/opt/hexcore-link/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ELECTRON"

}
