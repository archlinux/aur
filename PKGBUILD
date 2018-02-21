# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: eric <eric@archlinux.org>

pkgname=hexcurse
pkgver=1.60.0
pkgrel=1
pkgdesc="Versatile ncurses-based hex editor."
arch=('i686' 'x86_64')
#url="http://directory.fsf.org/project/HexCurse/"
url="https://github.com/LonnyGomes/hexcurse"
license=('GPL')
depends=('ncurses')
options=('!makeflags')
source=("$pkgname-$pkgver.tgz::https://github.com/LonnyGomes/hexcurse/archive/v$pkgver.tar.gz")
#source=("http://www.sourcefiles.org/Editors/Hex/$pkgname-$pkgver.tar.gz")
#source=("http://gd.tuwien.ac.at/opsys/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz")
#source=("https://github.com/LonnyGomes/hexcurse/archive/hexcurse-$pkgver.tar.gz")
md5sums=('cb24b564bea21a615a5c6a2ee30d6cad')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # gcc does not like clever people
  sed -i 's|buffer, 1,|NULL, 0,|' src/hexcurse.c
  sed -i 's|char buffer\[1\];|//&|' src/hexcurse.c
  sed -i 's|2*MAXY);|&\nbreak;|' src/acceptch.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
	--prefix=/usr \
	--mandir=/usr/share/man

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
