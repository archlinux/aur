# Maintainer: Yamashiro <dev cosmicheron com>

_pkgbase='yamagi-quake2-ref_gl4'
pkgname="${_pkgbase}-git"
pkgdesc='OpenGL 4.6 renderer for yamagi-quake2'
pkgver=r26.9a70da7
pkgrel=1
url='https://github.com/yquake2/ref_gl4'
arch=('x86_64')
license=('GPL-2.0-only' 'LicenseRef-custom')
depends=('glibc' 'glu' 'sdl3' 'yamagi-quake2')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("${_pkgbase}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	make -C "${srcdir}/${_pkgbase}" WITH_SDL3=YES
}

package() {
	# library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2" "${srcdir}/${_pkgbase}/release/ref_gl4.so"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" "${srcdir}/${_pkgbase}/README.md"

	# license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgbase}" "${srcdir}/${_pkgbase}/LICENSE"
}
