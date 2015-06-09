
# Contributor: Sascha Bennek <s.bennek@gmx.de>
pkgname=videogen
pkgver=0.33
pkgrel=1
pkgdesc="generates modelines for videocards"
arch=('i686' 'x86_64')
url="http://www.dynaweb.hu/opensource/videogen/"
license=('GPL2')
#groups=()
depends=('bc' 'glibc>=2.7-1')
makedepends=('pkgconfig')
source=(http://www.dynaweb.hu/opensource/videogen/download/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('41d0b11c245cb0bcc497c592ab6b4190')
build() {
  cd "$startdir/src/$pkgname-$pkgver"
  sed 's_/usr/local/bin_'"$startdir"'/pkg/'"$pkgname"'/usr/bin_' <Makefile >Makefile2
  sed 's_/usr/local/man_'"$startdir"'/pkg/'"$pkgname"'/usr/man_' <Makefile2 >Makefile
  rm -f Makefile2
  mkdir -p $startdir/pkg/$pkgname/usr/bin
  mkdir -p $startdir/pkg/$pkgname/usr/man/man1
  make || return 1
  echo make DESTDIR="$startdir/pkg/$pkgname" install
  make DESTDIR="$startdir/pkg/$pkgname" install
}

# vim:set ts=2 sw=2 et:
