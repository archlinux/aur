# Maintainer: Malah <malah@neuf.fr>
# Contributor: kaptoxic

pkgname=purple-discord-git
pkgver=v0.0.r190.22f49ce
_pkgver=v0.0.
_pkgdir=pidgin-discord
pkgrel=1
pkgdesc="A purple-based (Pidgin) plugin for Discord."
url='https://github.com/EionRobb/purple-discord'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git')
depends=('libpurple' 'json-glib')
replaces=('purple-discord')
provides=('purple-discord')
conflicts=('purple-discord')
source=('pidgin-discord::git+https://github.com/EionRobb/purple-discord.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgdir}/"
  printf "${_pkgver}r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgdir}/"
  make
}

package() {
  cd "$srcdir/${_pkgdir}/"
  make DESTDIR="$pkgdir" install
  #installing license
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

