# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=sfeed_curses
pkgname=sfeed-curses-git
pkgver=0.1.r0.g239d2c9
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('x86_64')
url='https://www.codemadness.org/sfeed_curses-ui.html'
license=('ISC')
depends=('ncurses')
makedepends=('git')
optdepends=('sfeed: RSS and Atom parser')
options=('!buildflags')
provides=("${_pkgname}")
source=("git://git.codemadness.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}" install
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
