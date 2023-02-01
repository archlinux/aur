# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-keesing
pkgver=4.1
pkgrel=1
pkgdesc='Dutch and Flemish puzzles from Keesing.com for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/philip.goto/puzzle-sets-keesing'
license=(GPL3)
depends=(
	crosswords
	python-argparse
	python-dateutil
	python-requests
	python-xmltodict
)
makedepends=(meson)
_commit=${pkgver}
_srcdir="puzzle-sets-keesing-${_commit}"
source=("${url}/-/archive/${_commit}/${_srcdir}.tar.gz")
b2sums=('b42083054219f9af2b1cbce1abd668c96f2f02386d1060a90a86f51197b18bd87123bae9ce62b23b7ec3d2364ed33ffa0872ff064d3db4ddb9b2835a6402be00')

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
