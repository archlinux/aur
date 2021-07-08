# Maintainer:  nissen22

# This PKGBUILD is heavily inspired by the cudatext-gtk2-bin package by ragouel
pkgname=cudatext-qt5-bin
_pkgname=cudatext
pkgver=1.137.0.0
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
sha256sums=('bb742951dec59d0d34bc13c2c775dffd31013b39b3bdc7face8c989572a1e2c4')

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
