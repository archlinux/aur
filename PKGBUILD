# Maintainer: Alberto Sánchez Molero <alsamolero at gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: TDY <tdy@gmx.com>

pkgname=moneymanagerex-git
_gitname=moneymanagerex
pkgver=1.3.0.r125.f70094d3
pkgrel=1
pkgdesc="An easy-to-use personal finance suite"
arch=('i686' 'x86_64')
url="http://www.moneymanagerex.org/"
license=('GPL')
depends=('wxgtk' 'webkitgtk2' 'hicolor-icon-theme') 
makedepends=('git' 'boost' 'gettext')
optdepends=('cups: for printing support')
replaces=('mmex')
provides=('moneymanagerex')
conflicts=('moneymanagerex')
source=(git+https://github.com/moneymanagerex/moneymanagerex.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "%s" "$(git describe --long --tag | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$_gitname"

  git submodule update --init
}

build() {
  cd "$srcdir/$_gitname"

  ./configure --prefix=/usr --disable-shared --enable-unicode
  make
  make po
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="${pkgdir}" install
}
