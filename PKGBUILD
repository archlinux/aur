# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-xword-dl
pkgver=0.4.3
pkgrel=1
pkgdesc='English puzzles from xword-dl for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-xword-dl'
license=(GPL3)
depends=(crosswords xword-dl)
makedepends=(meson)
_commit=${pkgver}
_srcdir="puzzle-sets-xword-dl-${_commit}"
source=("${url}/-/archive/${_commit}/${_srcdir}.tar.gz")
b2sums=('0f8f5b378ac323cb26f2eb4f71efc4af168243a1c320366538bb38c6ffb670db98fe296901b5de65342e757292bde5c08fbf15d122256536a28ba3d6cd6988c5')

build() {
	arch-meson "${_srcdir}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
