# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-nienteperniente
pkgver=0.1.0
pkgrel=1
pkgdesc='Italian puzzles from "BOOM!!! niente per niente" for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/davide125/puzzle-sets-nienteperniente'
license=(GPL3)
depends=(
	crosswords
	python-argparse
	python-puzpy
	python-requests
)
makedepends=(meson)
_commit=${pkgver}
_srcdir="puzzle-sets-nienteperniente-${_commit}"
source=("${url}/-/archive/${_commit}/${_srcdir}.tar.gz")
b2sums=('212bfc0a51a540ae3b3e4ce717f2d89ff84aa5b3a16fca114a0d5b88fca630ba78bc560e801a73a57bfe5a74c8f7fb2cccf94ef903e1ee64e6a6ce93f929d014')

build() {
	arch-meson "${_srcdir}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm755 "${_srcdir}/puzdownloader-nienteperniente.py" "${pkgdir}/usr/bin/puzdownloader-nienteperniente"
}
