# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Wieland Hoffmann

pkgname=dbmodel-qt5
_pkgname=dbmodel
pkgver=0.3
pkgrel=8
pkgdesc="A qt tool for drawing entity-relationship diagrams (Qt5 version)."
arch=('x86_64' 'pentium4' 'i686')
url="http://oxygene.sk/lukas/dbmodel/"
license=('GPL')
conflicts=('dbmodel')
depends=('qt5-base' 'qt5-svg' 'qt5-tools')
source=(https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz
        0001-quick-and-dirty-adaption-to-Qt5.patch
        0002-removed-duplicate-edit-delete.png.patch)
md5sums=('1b8e34a92d61d3819f4d7850e2bb5311'
         '254050ab48b6b751cbfe246ac5bca0df'
         'e6b32edef244e1366dfaa3c21063947f')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  # patches from https://git.andreasbaumann.cc/cgit/dbmodel/?h=qt5
  patch -Np1 -i "$srcdir/0001-quick-and-dirty-adaption-to-Qt5.patch"
  patch -Np1 -i "$srcdir/0002-removed-duplicate-edit-delete.png.patch"
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  qmake-qt5
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -D -m 555 \
	"$srcdir/$_pkgname-$pkgver/dbmodel" \
	"$pkgdir/usr/bin/dbmodel"
}
