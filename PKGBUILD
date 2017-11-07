# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=doxymacs-git
pkgver=20131007
pkgrel=1
pkgdesc="Use Doxygen from within Emacs -- git version"
arch=('i686' 'x86_64')
url="http://doxymacs.sourceforge.net"
license=('GPL2')
depends=('libxml2>=2.6.13')
makedepends=('git' 'texlive-latexextra')
provides=('doxymacs')
conflicts=('doxymacs')
install=doxymacs.install
source=('git+https://github.com/sgoericke/doxymacs.git')
md5sums=('SKIP')
_gitname="doxymacs"

prepare() {
  cd ${pkgname%-git}
  sed -i 's+inline+extern inline+' c/doxymacs_parser.c
}

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd ${pkgname%-git}
  ./bootstrap
  CC=gcc ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}
