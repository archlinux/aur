pkgname=log4cxx
pkgver=0.10.0
pkgrel=3
pkgdesc="A C++ port of Log4j"
url="http://logging.apache.org/log4cxx"
license="APACHE"
depends=('apr-util' 'libxml2')
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'libtool' 'patch' 'zip' 'gzip' 'sed')

source=(http://archive.apache.org/dist/logging/$pkgname/$pkgver/apache-$pkgname-$pkgver.tar.gz
        log4cxx-0.10.0-missing_includes.patch)
md5sums=('b30ffb8da3665178e68940ff7a61084c'
         'dfa17719a57b19f12cbef94419a2aac8')

build() {
  cd "$srcdir/apache-$pkgname-$pkgver"

  patch -p1 < $startdir/log4cxx-0.10.0-missing_includes.patch

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/apache-$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
