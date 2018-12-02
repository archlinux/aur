# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile-reader
_gitname=guile-reader
pkgver=0.6.2
pkgrel=2
pkgdesc="a simple framework for building readers for GNU Guile"
url="http://www.nongnu.org/guile-reader"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile')
makedepends=('gperf' 'git')
source=("http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz" gperf3.1.patch)
sha256sums=('fdcda586d8b5b15976df26b674fc4b2b9b4623db8e301a39aef85685b4d02215'
            '8e30fbd77f98d38d430a3641458b789714575117375a93fbbc50fad719383b06')
options=('!strip')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/gperf3.1.patch
}

build() {
  cd $pkgname-$pkgver
  autoreconf -i --force --verbose
  CFLAGS= CPPFLAGS= LDFLAGS=  ./configure --prefix=/usr 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
