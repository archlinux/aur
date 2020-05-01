# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=pythonmagick
pkgver=0.9.19
pkgrel=3
pkgdesc="Object-oriented Python bindings for the ImageMagick library"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('boost' 'python' 'imagemagick')
makedepends=('perl' 'automake')
options=('!libtool')
source=("http://www.imagemagick.org/download/python/PythonMagick-$pkgver.tar.gz")
sha256sums=('a26fbb030b5689730eaca2f1b7ee0a2e06083c547e66e622e2cd443c710427ce')

build() {
  cd "$srcdir/PythonMagick-$pkgver"
  perl autogen.pl

  CPPFLAGS="`python-config --includes`" \
  PYTHON_LIB="`python-config --libs`" \
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/PythonMagick-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pythonmagick/LICENSE"
}
