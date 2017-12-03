# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ukopp
pkgver=6.5
pkgrel=1
pkgdesc="A backup program for USB devices"
url="http://www.kornelix.com/ukopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz" makefile_no_images.patch)
sha256sums=('fdfbe90983f2edf29433da5e2fd10781935f3b68c1ce7b20426ad7d803481beb'
            '81f83802bc70da441f7e45da1e50507e014ac8b351562950f1dc085d9c2d6414')
options=('!emptydirs')

prepare() {
  cd ${srcdir}/$pkgname-$pkgver
  patch -Np1 < "$srcdir"/makefile_no_images.patch
}

build() {
  cd ${srcdir}/$pkgname-$pkgver
  export PREFIX=/usr
  make LDFLAGS="-lpthread"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/icons
  make DESTDIR=$pkgdir install
}
