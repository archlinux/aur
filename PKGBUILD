# Maintainer: Malah <malah@neuf.fr>
# Contributor: kaptoxic

pkgname=purple-discord-git
_pkgname=purple-discord
pkgver=v0.0.r849.20e5eed
_pkgver=v0.0.
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for Discord."
url='https://github.com/EionRobb/purple-discord'
arch=(any)
license=('GPL3')
makedepends=('git' 'imagemagick' 'librsvg' 'gettext')
depends=('libpurple' 'json-glib' 'qrencode')
replaces=('purple-discord')
provides=('purple-discord')
conflicts=('purple-discord')
source=('purple-discord::git+https://github.com/EionRobb/purple-discord.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}/"
  printf "${_pkgver}r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}/"
  make
}

package() {
  cd "$srcdir/${_pkgname}/"
  make DESTDIR="$pkgdir" install
  #installing license
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

