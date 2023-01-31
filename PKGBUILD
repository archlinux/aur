# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-xword-dl
pkgver=0.4.1
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
b2sums=('67e56219c075e4c6a25e7d67c58ae31cd276ac45a432d05cf84a94a9f6fb54337b45da4814ae007963c1aafd7353f8fca9cc97b99a294a5862cedf44182d6069')

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
