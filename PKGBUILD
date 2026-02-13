# Maintainer: Erwin Iosef <erwiniosef@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-pzzl
pkgver=4.1
pkgrel=1
pkgdesc='Dutch puzzles from De Telegraaf for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/philip.goto/puzzle-sets-pzzl'
license=('GPL-3.0-or-later')
depends=(
	'crosswords'
	'python'
	'python-dateutil'
	'python-requests'
)
makedepends=('meson')
_srcdir="puzzle-sets-pzzl-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
b2sums=('60fddd207d670bf897c759d42aaa563d130400f013b8d921fdf52d628f3a74aceaf688db1552b17c98350c98d34e5445caedba4241cbd03c2c9ac0f94289b288')

build() {
	arch-meson "${_srcdir}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm755 "${_srcdir}/ipzzl.py" "${pkgdir}/usr/bin/ipzzl"
}
