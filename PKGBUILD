# Maintainer: stitran <tristan dot zuerl at gmx dot net

pkgname=boxes-git
pkgver=304
pkgrel=1
pkgdesc="Text mode box and comment drawing filter"
url="http://boxes.thomasjensen.com/"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('boxes')
source=("git://github.com/ascii-boxes/boxes.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/boxes
  echo "$(git rev-list --count HEAD)"
}

build() {
  cd $srcdir/boxes
  make GLOBALCONF=/etc/boxes-config
}

package() {
  cd $srcdir/boxes
  install -D -m 644 doc/boxes.1 $pkgdir/usr/share/man/man1/boxes.1
  install -D -m 644 boxes-config $pkgdir/etc/boxes-config
  install -D -m 755 src/boxes $pkgdir/usr/bin/boxes
}
