# Maintainer: Erwin Iosef <erwiniosef@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-keesing
pkgver=4.4
pkgrel=1
pkgdesc='Dutch and Flemish puzzles from Keesing.com for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/philip.goto/puzzle-sets-keesing'
license=('GPL-3.0-or-later')
depends=(
	'crosswords'
	'python'
	'python-dateutil'
	'python-requests'
	'python-xmltodict'
)
makedepends=('meson')
_srcdir="puzzle-sets-keesing-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
b2sums=('1773b0862c4d4b9d86d158ca666af26d1a1c817e49c56ffa73e8879a4cda33302259bd3932a0a8873814522992447643891889b7bf60f08b462fdbe9a6c52419')

build() {
	arch-meson "${_srcdir}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm755 "${_srcdir}/ikeesing.py" "${pkgdir}/usr/bin/ikeesing"
}
