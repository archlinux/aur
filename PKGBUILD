# Maintainer: Bernard Baeyens (berbae)  <berbae52 at sfr dot fr>
# Contributor: Sébastien Piccand <sebcactus gmail com>
pkgname=sudoku-savant
pkgver=1.3
pkgrel=6
pkgdesc="A GUI application to solve and generate sudoku puzzles through logical means"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sudoku-savant/"
license=('GPL')
depends=('gtk2')
#source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
#source=(http://www.mirrorservice.org/sites/downloads.sourceforge.net/s/su/sudoku-savant/\
#sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2)
source=(https://sourceforge.net/projects/sudoku-savant/files/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2)
sha1sums=('6bbe3e0038457fb8f66bec340653c73ca109f990')

prepare() {
	cd "$srcdir"/$pkgname-$pkgver
	# Fix installation path for the .desktop file
	sed -i 's|$(datadir)/app|$(DESTDIR)$(datadir)/app|' Makefile.in
	sed -i 's|$(datadir)/pixmaps|$(DESTDIR)$(datadir)/pixmaps|' Makefile.in
	sed -i 's|sudoku.desktop|sudoku-savant.desktop|' Makefile.in
	# Fix the non-standard .desktop file
	sed -i 's|GNOME;GTK;Application;Game;|Game;|' $pkgname.desktop.in
}

build() {
	cd "$srcdir"/$pkgname-$pkgver
	CXXFLAGS='-D_GLIBCXX_USE_CXX11_ABI=0' ./configure --prefix=/usr
#	CXXFLAGS='-std=c++98' ./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/share/pixmaps
	make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
