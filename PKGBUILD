# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-keesing
pkgver=4.3
pkgrel=1
pkgdesc='Dutch and Flemish puzzles from Keesing.com for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/philip.goto/puzzle-sets-keesing'
license=(GPL3)
depends=(
	crosswords
	python-dateutil
	python-requests
	python-xmltodict
)
makedepends=(meson)
_commit=${pkgver}
_srcdir="puzzle-sets-keesing-${_commit}"
source=("${url}/-/archive/${_commit}/${_srcdir}.tar.gz")
b2sums=('34f8e2fb9f2a8680574eb3a1a9a5db40d2f74e416c6c8b4a1a834d782a3fa6380788354851d27d3866a6ac040b223735da7abc3b5c2c7e4b2643bba8cb9ccf8c')

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
