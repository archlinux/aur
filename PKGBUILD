# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=pythonmagick
pkgver=0.9.19
pkgrel=2
pkgdesc="Object-oriented Python bindings for the ImageMagick library"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('boost' 'python' 'imagemagick')
makedepends=('perl' 'automake')
options=('!libtool')
source=("http://www.imagemagick.org/download/python/PythonMagick-$pkgver.tar.gz")
sha256sums=('dda6f31142d0d82c7e67897e5d6a7cc7af9ca95f0212112b6343c0ce470751e8')

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
