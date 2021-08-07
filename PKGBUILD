# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sfeed_curses'
pkgname="${_pkgname/_/-}"
pkgver=1.0
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('any')
url='https://www.codemadness.org/sfeed_curses-ui.html'
_url_source='https://codemadness.org/releases/sfeed_curses'
license=('ISC')
depends=('sh' 'ncurses')
optdepends=('sfeed: RSS and Atom parser')
source=("${_url_source}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f90b26e19e3c4457c88d430ecfccf428576d9af1d560240ac1dc3c11b73e4c12')

build() {
  # Theming support: SFEED_THEME can be set to mono_highlight, newsboat, templeos
  make SFEED_THEME=mono -C "${_pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${_pkgname}-${pkgver}" install
  install -Dvm644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
