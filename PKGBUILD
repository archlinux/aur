# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-pzzl
pkgver=4.0
pkgrel=1
pkgdesc='Dutch puzzles from De Telegraaf for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/philip.goto/puzzle-sets-pzzl'
license=(GPL3)
depends=(
	crosswords
	python-argparse
	python-dateutil
	python-requests
)
makedepends=(meson)
_commit=${pkgver}
_srcdir="puzzle-sets-pzzl-${_commit}"
source=("${url}/-/archive/${_commit}/${_srcdir}.tar.gz")
b2sums=('8e9e024e9ad8b9735a10e113e2f8569707ced2674ede57d57be29a565959ece879bce8bd3322f24be1cb3450bccb004377c05357a0f5265492343ec5d761910c')

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
