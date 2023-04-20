# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-keesing
pkgver=4.2
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
b2sums=('fa7c2406a1f2e56270a2ec849dda092be8ad95d1c4d9ebc050c6a2591152421c5868e15010f8e494c93a35bd100130e3d2ee07047bafc3aa74f7dc869edba590')

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
