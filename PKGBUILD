# Maintainer: Yamashiro <dev at cosmicheron dot com>

pkgname='yamagi-quake2-ref_gl4'
pkgdesc='OpenGL 4.6 renderer for yamagi-quake2'
pkgver='1.09'
pkgrel='1'
url='https://github.com/yquake2/ref_gl4'
arch=('x86_64')
license=('GPL-2.0-only' 'LicenseRef-custom')
depends=('glibc' 'glu' 'sdl3' 'yamagi-quake2')
_refgl4="ref_gl4-${pkgver}"
source=("${_refgl4}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d2406d83a86c7ae0ae0fd97c58cd2129279fc93260c63896082d19be7d8c39bd5a01d7255a65d4b81687b6945f189330aba0aa917e72acfcef338410fd912783')

build() {
	env CFLAGS="$(sed -r 's/[[:space:]]?-Wp,-D_FORTIFY_SOURCE=[[:digit:]]+//' <<<"$CFLAGS")" make -C "${srcdir}/${_refgl4}" WITH_SDL3=YES
}

package() {
	# library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2" "${srcdir}/${_refgl4}/release/ref_gl4.so"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/${_refgl4}/README.md"

	# license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/${_refgl4}/LICENSE"
}
