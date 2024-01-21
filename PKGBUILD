# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-xword-dl
pkgver=0.4.6
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
b2sums=('67572247d0fdc3fd2128362957589d190d79eeded4873c1710b30676ef8ca2560eeedd78913a2ced459874cf3e95dede0ddc1432de456bacb46f657bbf5e487a')

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
