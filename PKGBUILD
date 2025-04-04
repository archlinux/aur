# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='yamagi-quake2-ref_gl4'
pkgdesc='OpenGL 4.6 renderer for yamagi-quake2'
pkgver='1.08'
pkgrel='3'
url='https://github.com/yquake2/ref_gl4'
arch=('x86_64')
license=('GPL-2.0-only' 'LicenseRef-custom')
depends=('glibc' 'glu' 'sdl3' 'yamagi-quake2')
_refgl4="ref_gl4-${pkgver}"
source=("${_refgl4}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('eda8ab71eccf74220449a99d005e120c148f6c97e2aa9c10902e7ddda404313728daa0afb6b0c5a558d1af88d495669dfae84b4a835b76c09b831fd546f03990')

build() {
	make -C "${srcdir}/${_refgl4}" WITH_SDL3=yes
}

package() {
	# library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2" "${srcdir}/${_refgl4}/release/ref_gl4.so"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${_refgl4}/README.md"

	# license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_refgl4}/LICENSE"
}
