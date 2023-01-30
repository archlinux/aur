# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords-puzzle-sets-gnome
pkgver=0.4.0
pkgrel=1
pkgdesc='Additional official English puzzles for the app Crosswords'
arch=(any)
url='https://gitlab.gnome.org/jrb/puzzle-sets-gnome'
license=(GPL3)
depends=(crosswords)
makedepends=(meson)
_commit=${pkgver}
_srcdir="puzzle-sets-gnome-${_commit}"
source=("${url}/-/archive/${_commit}/${_srcdir}.tar.gz")
b2sums=('c32f8cd5f391cec6d003983917c0db3341417d6be18694eafe29f18618b6b084f277cbaa5f73fb9fcc490196ecf627ff5002e20dc1ade4a2a4c7771be0881705')

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
