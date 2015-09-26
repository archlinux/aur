# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot com>

pkgname=dxflib
pkgver=2.5.0.0
pkgrel=2
pkgdesc="Open source C++ library mainly for parsing DXF files"
arch=("x86_64" "i686")
url="http://www.ribbonsoft.com/en/what-is-dxflib"
license=('GPL')
source=("http://www.ribbonsoft.com/archives/$pkgname/$pkgname-$pkgver-1.src.tar.gz"
        "dxflib-type92.diff"
        "dxflib-automake.diff")
md5sums=('97a22444c10fb3cff5cec9f9c21d5c55'
         '7f635aa41cdbb53928640b9068150a3d'
         '4f1b6ab56de5be85840b92c175ab541f')

build() {
  cd "$srcdir/$pkgname-$pkgver-1.src"
  patch -p1 -i ${srcdir}/dxflib-type92.diff
  patch -p1 -i ${srcdir}/dxflib-automake.diff

  chmod +x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-1.src"
  make DESTDIR="$pkgdir/" install
}
