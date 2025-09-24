# Maintainer:
pkgname=pdfium-binaries-v8-bin
pkgver=7428
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
	"86267e7c62f505e7c9df6c55a0bf1d9817ba4de4d0ecb5f2953084627a4aeeb1d78fae7fd5afe3f593504dd0c3b86a419786833a7b5cfcc8fd961a7717868b67"
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
