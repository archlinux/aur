# Contributor: Zdenek Janak <janak@astronomie.cz>

pkgname=munipack
pkgver=0.5.7
pkgrel=1
pkgdesc="A general astronomical image processing software"
arch=('i686' 'x86_64')
url="http://munipack.physics.muni.cz/"
license=('GPL3')
depends=(cfitsio wxgtk webkitgtk2)
makedepends=(gcc-fortran)
optdepends=('fitspng: for FITS to PNG conversion'
            'rawtran: for RAW to FITS conversion')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b012be15091253bbc350b78d7b9458a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure FCFLAGS=-std=legacy --prefix=/usr --libexecdir=/usr/lib
  make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
