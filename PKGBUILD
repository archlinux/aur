# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=cdargs
pkgver=1.35
pkgrel=8
pkgdesc="Replacement for 'cd' that includes bookmarks/browsing for faster navigation"
arch=('x86_64')
license=('GPL')
url='http://www.skamphausen.de/cgi-bin/ska/CDargs'
depends=('ncurses' 'gcc-libs' 'bash')
source=("http://www.skamphausen.de/downloads/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('2165AF40D64494895B947503B33F54780BA0A295') # Stefan Kamphausen
md5sums=('50be618d67f0b9f2439526193c69c567'
         'SKIP')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
  make -C contrib
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make -C contrib DESTDIR="$pkgdir" install
  
  install -d "$pkgdir/usr/share/cdargs"
  install "contrib/$pkgname-"{tcsh.csh,bash.sh} "$pkgdir/usr/share/cdargs"
}

# vim:set ts=2 sw=2 et:
