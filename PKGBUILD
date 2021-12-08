# Maintainer: Nobody <>

HNCCONTEXT=opt/hnc/hofficeviewer11/Bin/qt/plugins/platforminputcontexts
NIMFLIB=libqt5im-nimf.so
KIMELIB=libkime-qt-5.11.3.so

_referer='Referer: https://www.hancom.com/cs_center'
DLAGENTS=("https::/usr/bin/curl -# -o %o -H ${_referer// /\\ } %u")

pkgname='hoffice-viewer'
pkgver=11.20.0.991
pkgrel=5
pkgdesc='Office document viewer for Linux'
arch=('x86_64')
url='https://www.hancom.com/'
license=('custom:hoffice-viewer')
depends=('cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'glu' 'harfbuzz' 'harfbuzz-icu' 'libcups' 'libcurl-gnutls' 'libxcb' 'qt5-base' 'qt5-x11extras' 'zlib')

source=(
	'https://cdn.hancom.com/pds/hnc/DOWN/gooroom/hoffice_viewer_2020_amd64.deb'
	'LICENSE'
	'libqt5im-nimf.so'
)
sha256sums=(
	'db25bfbbe3661625ef3640f619db106f7be9745808277f8a0614f859270dacdd'
	'f2524728f91bf392edfbc3afce2126c7f0df8e22fc00b798f09e50693cf852e0'
	'd246c02a20a1e4ea123f9c2275dfc4a2ea091a65032ddbbe8a59bfc71418f60c'
)

package() {
	curl -# -o "${srcdir}/${KIMELIB}" -fL 'https://github.com/Riey/kime/releases/latest/download/libkime-qt-5.11.3.so'
	msg2 "Extracting data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hoffice-viewer/LICENSE"
	if [ -f "${srcdir}/${KIMELIB}" ] && [ -f "${srcdir}/${NIMFLIB}" ]; then
		install -Dm755 -t "${pkgdir}/${HNCCONTEXT}" "${srcdir}/${KIMELIB}"
		install -Dm755 -t "${pkgdir}/${HNCCONTEXT}" "${srcdir}/${NIMFLIB}"
	fi
	msg2 "The error messages are from UTF-8 limitations. Please ignore it, as it does no harm."
}
