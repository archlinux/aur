# Contributor: Orivej Desh <orivej@gmx.fr>
# Contributor: Benjamin van der Burgh <benjaminvdb@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=epstool
pkgver=3.09
pkgrel=1
pkgdesc="Utility to create or extract preview images in EPS files, fix bounding boxes and convert to bitmaps"
arch=('i686' 'x86_64')
url="http://pages.cs.wisc.edu/~ghost/gsview/epstool.htm"
license=('GPL')
source=("http://www.ghostgum.com.au/download/$pkgname-$pkgver.zip" Makefile)
sha256sums=('f56f2987b1a0cc759fd6ea80fd49f85c1d4d1cc3b8c60798f8ddd9b42aa3c080'
            '69fe66e25a35adce7861a415e6f14442745438da0850e15bc907cac9a3340001')
depends=('glibc')
makedepends=('dos2unix')
noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  find "$srcdir"/$pkgname-$pkgver $pkg -type f -exec dos2unix {} \;
  find "$srcdir"/$pkgname-$pkgver -type f -name "*.exe" -exec rm {} \;
  cd $pkgname-$pkgver
  
  cp "$srcdir"/Makefile makefile
}

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  make prefix="${pkgdir}" EPSTOOL_ROOT=/usr install
}

