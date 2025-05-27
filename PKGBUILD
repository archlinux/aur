# Maintainer:  eltonff

# This PKGBUILD is heavily inspired by the cudatext-qt5-bin package
pkgname=cudatext-qt6-bin
_pkgname=cudatext
pkgver=1.224.0.0
pkgrel=0
pkgdesc="Cross-platform text editor, written in Lazarus. Qt6 edition."
arch=('x86_64')
url="https://cudatext.github.io"
license=('MPL2')
depends=('qt6pas'
         'python')
makedepends=('gendesk')
provides=('cudatext')
conflicts=('cudatext')
options=('!strip')
source=("https://sourceforge.net/projects/cudatext/files/release/${pkgver}/cudatext-linux-qt6-amd64-${pkgver}.tar.xz")
sha256sums=('879f1a8f47b004312bc9815cd7ce7552497db92271f9d660cb056edbd4d0e4fe')

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
