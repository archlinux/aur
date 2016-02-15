# Contributor: Brent Carmer

pkgname=yices
pkgver=2.4.2
pkgrel=1
pkgdesc="An automatic theorem prover - compile from source"
arch=('i686' 'x86_64')
url="http://yices.csl.sri.com/"
license=('custom')
conflicts=('yices-bin')
builddepends=(
  'gcc>=4.0.0'
  'gperf>=3.0.0'
  'gmp>=4.1.0'
  'make'
)
source=("http://yices.csl.sri.com/cgi-bin/yices2-newnewdownload.cgi?file=yices-$pkgver-src.tar.gz&accept=I+Agree")
sha512sums=('597558d3a7ffe870e79d878de292f8cf2993a5a8a69c0cda77849fd3bb20d6fbb784da0df202b1abd8f6c3976dfca5d3b10f94e067043e1c29e87d1e7161a4ef')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
