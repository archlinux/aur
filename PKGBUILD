# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-mmm-mode-git
pkgver=20170221
pkgrel=1
pkgdesc="Minor mode for Emacs that allows Multiple Major Modes to coexist in one buffer"
arch=('any')
url="http://mmm-mode.sourceforge.net"
license=('GPL')
makedepends=('git')
provides=('emacs-mmm-mode' 'mmm-mode')
conflicts=('emacs-mmm-mode' 'mmm-mode')
source=('git://github.com/purcell/mmm-mode.git')
_gitname="mmm-mode"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd "$srcdir/$_gitname"
  mv configure.in configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
