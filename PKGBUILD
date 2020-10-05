# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sfeed_curses'
pkgname="${_pkgname/_/-}"
pkgver=0.9.3
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('x86_64')
url='https://www.codemadness.org/sfeed_curses-ui.html'
license=('ISC')
depends=('ncurses')
optdepends=('sfeed: RSS and Atom parser')
source=("${url%/*}/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('579c11e36ec02d00c63ca354da44285eb5ecdf89f9690c750c08a74543757b14')

prepare() {
  # Remove deprecated _BSD_SOURCE
  sed -i.bak 's/_BSD_SOURCE/_DEFAULT_SOURCE/g' "${_pkgname}-${pkgver}/Makefile"
}

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}-${pkgver}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
