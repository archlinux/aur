# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sfeed_curses'
pkgname="${_pkgname/_/-}"
pkgver=0.9.2
pkgrel=3
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('x86_64')
url='https://www.codemadness.org/sfeed_curses-ui.html'
license=('ISC')
depends=('ncurses')
optdepends=('sfeed: RSS and Atom parser')
source=("${url%/*}/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('19a46fe4de63fe033ad836efc2b002ecea157946ed2af2801124d9283dc11511')

prepare() {
  # https://git.codemadness.org/sfeed_curses/commit/0a9c4460c15e90113607ff1928858dfa940df725.html
  sed -i.bak 's/${CC} ${SFEED_LDFLAGS} -o $@ $</${CC} -o $@ $< ${SFEED_LDFLAGS}/g' "${_pkgname}-${pkgver}/Makefile"
}

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "${_pkgname}-${pkgver}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
