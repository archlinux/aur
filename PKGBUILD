# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=chemtool-proper
pkgver=1.6.14
pkgrel=2
pkgdesc="Chemtool without the stupid right justified help menu"
arch=(i686 x86_64)
license=('GPL2')
url="http://ruby.chemie.uni-freiburg.de/~martin/chemtool/chemtool.html"
depends=('gtk2')
replaces=('chemtool')
provides=('chemtool')
options=(!libtool)
source=(http://ruby.chemie.uni-freiburg.de/~martin/chemtool/chemtool-$pkgver.tar.gz chemtool.desktop)

build() {
  cd "$srcdir"/chemtool-$pkgver
  sed -i -e 's/.*right_justify.*//g' main.c
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir"/chemtool-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 gnome/chemtool.png "$pkgdir"/usr/share/pixmaps/chemtool.png
  install -D -m644 "$srcdir"/chemtool.desktop "$pkgdir"/usr/share/applications/chemtool.desktop
}

md5sums=('3a97680f0abe1327af1f0072551a68e2'
         '8cbb6f7021bd5aaa6f6a31fc4d95a06e')
