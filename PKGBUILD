# Contributor: Sausageandeggs <s_stoakley at hotmail.co.uk>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=nautilus-open-terminal-git
_gitname=nautilus-open-terminal
pkgver=0.20.2.g28f5d6d
pkgrel=1
pkgdesc="Nautilus plugin for opening terminals in arbitrary local paths and on SSH servers"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/nautilus-open-terminal/"
license=('GPL')
depends=('nautilus' 'intltool' 'gettext')
makedepends=('git' 'gnome-common')
provides=('nautilus-open-terminal')
conflicts=('nautilus-open-terminal')

source=('git://git.gnome.org/nautilus-open-terminal' 'automake.diff')

sha256sums=('SKIP'
            '6573ba31b144526f36b1755a1f9b80539def1e89579c1fa868d5a995f2f17ff2')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g' | sed 's|NAUTILUS_OPEN_TERMINAL_||g' | sed 's|_|.|g'
}

build() {
  cd $_gitname
  patch -p1 < ../../automake.diff
  ./autogen.sh --prefix=/usr
  make || return 1
}

package() {
	cd $_gitname
  make DESTDIR="$pkgdir/" install
}
