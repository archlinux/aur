# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=lttoolbox-java
pkgver=3.2.0
pkgrel=1
pkgdesc="Java port of lttoolbox. Handles lexical processing, morphological analysis and generation of words in natural languages using fast finite state transducers."
url="http://wiki.apertium.org/wiki/Lttoolbox-java"
license=('GPL2')
makedepends=('apache-ant')
depends=('java-runtime' 'sh')
options=('!libtool')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/apertium/${pkgname}-${pkgver}.tar.gz
        'Makefile.patch')
md5sums=('6e029b981a721c6ad515d879e4a6478a'
         '2304c7390728fea1b8d0ba2cce2bd780')

build() {
  patch -p0 < Makefile.patch

  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  # There is some bug in the released source; so use the pre-packaged 
  # one instead (this is fixed upstream though, waiting for new release):
  cp lttoolbox.jar $pkgdir/usr/share/apertium
}