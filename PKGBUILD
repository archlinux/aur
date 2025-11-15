# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Wieland Hoffmann

pkgname=dbmodel
pkgver=0.3
pkgrel=8
pkgdesc="A qt tool for drawing entity-relationship diagrams."
arch=('x86_64' 'pentium4' 'i686')
url="http://oxygene.sk/lukas/dbmodel/"
license=('GPL')
conflicts=('dbmodel-qt5')
depends=('qt6-base' 'qt6-svg' 'qt6-tools')
source=(http://launchpad.net/dbmodel/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
        0001-removed-duplicate-edit-delete.png.patch
        0002-quick-and-dirty-adaption-to-Qt6.patch)
md5sums=('1b8e34a92d61d3819f4d7850e2bb5311'
         '535629809d9d6f416155a2bf00047118'
         'd1bcbb0962f4307c8f0dcc886d4c915d')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  # patches from https://git.andreasbaumann.cc/cgit/dbmodel/?h=qt6
  patch -Np1 -i "$srcdir/0001-removed-duplicate-edit-delete.png.patch"
  patch -Np1 -i "$srcdir/0002-quick-and-dirty-adaption-to-Qt6.patch"
}

build() {
  cd $srcdir/$pkgname-$pkgver
  qmake6
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 555 \
	"$srcdir/$pkgname-$pkgver/dbmodel" \
	"$pkgdir/usr/bin/dbmodel"
}
