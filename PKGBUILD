# Maintainer:
pkgname=pdfium-binaries-bin
pkgver=7428
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
	"18e77d4609d3468c25c4bba84275508a9b0dfd6964e9027e5fa2afadacdd90e066930edee05b76e1e707d8954853d1c6cd794d4f4dff064e31a597ba4c0b5690"
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
