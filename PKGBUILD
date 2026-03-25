# Maintainer:
pkgname=pdfium-binaries-bin
pkgver=7749
pkgrel=1
pkgdesc='PDFium binaries built with scripts from pdfium-binaries'
arch=('x86_64')
url='https://github.com/bblanchon/pdfium-binaries'
license=('Apache')
makedepends=('git' 'ninja' 'cmake' 'pkgconf' 'python' 'procps-ng' 'lsb-release')
provides=('libpdfium')
conflicts=('libpdfium-nojs' 'pdfium-binaries-v8' 'pdfium-binaries-v8-bin')
_package_name_base='pdfium-linux-x64'
_package_name="${_package_name_base}.tgz"

source=(
	"https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F${pkgver}/${_package_name}"
)

sha512sums=(
	"554ea37e4c7819a7727777c9592b650659047c3c3272d787229fa1510993a1571ae1bd0daf3ee9945761e94b6d5659ac2822d92418d0f1433c755bcf592fb21f"
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
