# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=doxymacs-git
pkgver=20100307
pkgrel=1
pkgdesc="Use Doxygen from within Emacs -- git version"
arch=('i686' 'x86_64')
url="http://doxymacs.sourceforge.net"
license=('GPL')
depends=('libxml2>=2.6.13')
makedepends=('git' 'texlive-latexextra')
provides=('doxymacs')
conflicts=('doxymacs')
install=doxymacs.install
source=('git://doxymacs.git.sourceforge.net/gitroot/doxymacs/doxymacs')
md5sums=('SKIP')
_gitname="doxymacs"

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/$_gitname"
  ./bootstrap
  CC=gcc ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
