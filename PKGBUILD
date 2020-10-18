# Maintainer:  nissen22

# This PKGBUILD is heavily inspired by the cudatext-gtk2-bin package by ragouel
pkgname=cudatext-qt5-bin
_pkgname=cudatext
pkgver=1.115.0.1
pkgrel=0
pkgdesc="Cross-platform text editor, written in Lazarus. Qt5 edition."
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('qt5pas'
         'python')
makedepends=('gendesk')
provides=('cudatext')
conflicts=('cudatext-gtk2-bin')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext-linux-qt5-amd64-${pkgver}.tar.xz")
sha256sums=('9b7e13c29a8d11ffe00e5926139727d1fa12f5b1a1f871e7098d1e701ac32a2c')

prepare() {
	echo "Creating desktop file"
	gendesk -f -n --pkgname ${_pkgname} --pkgdesc "${pkgdesc}" --categories "Developement" --icon "cudatext-512" --exec "cudatext"
}

package() {
	install -Dm0755 ${srcdir}/cudatext ${pkgdir}/usr/bin/cudatext
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/cudatext-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cudatext-512.png"
	mkdir "${pkgdir}/usr/share/cudatext"
	chmod 755 "${pkgdir}/usr/share/cudatext"
	cp -r "${srcdir}/data" "${pkgdir}/usr/share/cudatext/"
	cp -r "${srcdir}/py" "${pkgdir}/usr/share/cudatext/"
	cp -r "${srcdir}/settings_default" "${pkgdir}/usr/share/cudatext/"
}
