# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-oedipus
pkgver=0.1.1
pkgrel=1
pkgdesc='Italian puzzles from Oedipus for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/davide125/puzzle-sets-oedipus'
license=(GPL3)
depends=(
	crosswords
	python-argparse
	python-puzpy
	python-requests
)
makedepends=(meson)
_commit=${pkgver}
_srcdir="puzzle-sets-oedipus-${_commit}"
source=("${url}/-/archive/${_commit}/${_srcdir}.tar.gz")
b2sums=('f9e5ad5da27493ce3978ead80bf213937922eaba4536e2cecdcf9b5dabc4ba0d9d410edb8ef69aa89ae15505d9603c98c2d9de0e5f9a57745b2e2963022a76e0')

build() {
	arch-meson "${_srcdir}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm755 "${_srcdir}/puzdownloader-oedipus.py" "${pkgdir}/usr/bin/puzdownloader-oedipus"
}
