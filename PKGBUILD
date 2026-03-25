# Maintainer:
pkgname=pdfium-binaries-v8-bin
pkgver=7749
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
	"7319cc5f9e4357502e3cab05261c94edad6abdde904cde33440750a2e9a67dae4800a470887aea427c7ed4bdcdf352ae85d31bff5a9e3a4278949c0e9d73c689"
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
