# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sfeed_curses'
pkgname="${_pkgname/_/-}"
pkgver=0.9.12
pkgrel=1
pkgdesc='Curses UI front-end for sfeed RSS and Atom parser'
arch=('any')
url='https://www.codemadness.org/sfeed_curses-ui.html'
_url_source='https://codemadness.org/releases/sfeed_curses'
license=('ISC')
depends=('ncurses')
optdepends=('sfeed: RSS and Atom parser')
source=("${_url_source}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d08a481c6a4f74cac3e16bda6c5373fe4ce068afa11a09d75b727e07b739d581')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  # Theming support: SFEED_THEME can be set to mono_highlight, newsboat, templeos
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' SFEED_THEME=mono -C "${_pkgname}-${pkgver}" install
  install -Dvm644 "${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
