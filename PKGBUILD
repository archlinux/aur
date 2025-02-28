# Maintainer:
pkgname=pdfium-binaries-v8-bin
pkgver=7033
pkgrel=1
pkgdesc='PDFium binaries built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('git' 'ninja' 'cmake' 'pkgconf' 'python' 'procps-ng' 'lsb-release')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries-v8' 'pdfium-binaries-bin')
_package_name_base='pdfium-v8-linux-x64'
_package_name="${_package_name_base}.tgz"

source=(
	"https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F${pkgver}/${_package_name}"
)

sha512sums=(
	"5d1c257d5ea4a77d7b13b7c39211ceda3f2471f69ea9eb0a3d11fcbf87e82ac402c4b4119d5b7715fb67b137415c176afa9cb706482db16d046cee94c34ad7de"
)

prepare() {
	tar -xzf ${_package_name}
}

package() {
	echo ${pkgdir}
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/pdfium/LICENSE"
	install -Dm644 "${srcdir}/PDFiumConfig.cmake" "${pkgdir}/usr/lib/cmake/PDFium/PDFiumConfig.cmake"
	cp -ar "${srcdir}/include" "${pkgdir}/usr"
	cp -ar "${srcdir}/lib" "${pkgdir}/usr"
}
