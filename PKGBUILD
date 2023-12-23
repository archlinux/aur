# Maintainer: Yamashiro <dev@cosmicheron.com>

_pkgbase='yamagi-quake2-ref_gl4'
pkgname="${_pkgbase}-git"
pkgdesc='OpenGL 4.6 renderer for yamagi-quake2'
pkgver=r1.a10924a
pkgrel=1
url='https://github.com/yquake2/ref_gl4'
arch=('x86_64')
license=('GPL2' 'custom')
depends=('yamagi-quake2')
makedepends=('git' 'sdl2' 'mesa')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	make -C "$_pkgbase"
}

package() {
	cd "$_pkgbase"

	# library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2" 'release/ref_gl4.so'

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" 'README.md'

	# license
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgbase}" 'LICENSE'
}
