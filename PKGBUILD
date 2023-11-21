# Maintainer:  nissen22

# This PKGBUILD is heavily inspired by the cudatext-gtk2-bin package by ragouel
pkgname=cudatext-qt5-bin
_pkgname=cudatext
pkgver=1.202.0.1
pkgrel=0
pkgdesc="Cross-platform text editor, written in Lazarus. Qt5 edition."
arch=('x86_64')
url="http://uvviewsoft.com/cudatext"
license=('MPL2')
depends=('qt5pas'
         'python')
makedepends=('gendesk')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("http://www.uvviewsoft.com/cudatext/files_linux/cudatext-linux-qt5-amd64-${pkgver}.tar.xz")
sha256sums=('559f7f170def4da4c58fbf623e3e44b7f0d6baa84d07731138ac8bf39667509d')

prepare() {
	echo "Creating desktop file"
	gendesk -f -n --pkgname ${_pkgname} --name "CudaText" --pkgdesc "${pkgdesc}" --categories "Development" --icon "cudatext-512" --exec "cudatext" --mimetypes "text/plain"
    }

package() {
	install -Dm0755 ${srcdir}/cudatext/cudatext ${pkgdir}/usr/bin/cudatext
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/cudatext/cudatext-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cudatext-512.png"
	mkdir "${pkgdir}/usr/share/cudatext"
	chmod 755 "${pkgdir}/usr/share/cudatext"
	cp -r "${srcdir}/cudatext/data" "${pkgdir}/usr/share/cudatext/"
	cp -r "${srcdir}/cudatext/py" "${pkgdir}/usr/share/cudatext/"
	cp -r "${srcdir}/cudatext/settings_default" "${pkgdir}/usr/share/cudatext/"
}
