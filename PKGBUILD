# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: GdelaRey <arch at delarey dot org>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: David Hummel <david dot hummel at gmail point com>

_pkgname=the
_pkgver=4.0
pkgname=hessling-editor-das
pkgver=4.0
pkgrel=1
pkgdesc="A powerful text editor modelled on the VM/CMS text editor XEDIT with the best features of Mansfield Software's Kedit."
arch=('i686' 'x86_64')
url="http://hessling-editor.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'regina-rexx-das')
provides=('hessling-editor')
options=(!buildflags)
source=("http://downloads.sourceforge.net/$provides/$_pkgname-$_pkgver.tar.gz")
sha512sums=('9d8a9d864caa729a83f41932186eb6929e69207231a0d241b9574cf6af02aeeb28b53492af54e4c1ced3afa868060e8031aadf33b1168a8d9aeae14a8e9c1c86')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  unset CFLAGS CXXFLAGS LDFLAGS
  ./configure --with-rexx=regina --with-curses=ncurses --prefix=/usr
  make the-con
  make the.man
  make THE_Help.txt
}

package(){
  make -C "$_pkgname-$_pkgver" DESTDIR=$pkgdir install
}
