# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtoctave
pkgver=0.10.1
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Qt4 frontend for octave"
url="https://forja.rediris.es/projects/csl-qtoctave/"
license=('GPL2')
depends=('qt4' 'octave')
makedepends=('cmake')
source=("http://forja.rediris.es/frs/download.php/2054/${pkgname}-${pkgver}.tar.gz")
md5sums=('f23afd8eb850b950f51b65f256a83835')
install="qtoctave.install"
options=('!libtool' '!emptydirs')
      
build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/\"lrelease\"/\"lrelease-qt4\"/" qtoctave/src/CMakeLists.txt

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_SKIP_RPATH=ON -DCMAKE_BUILD_TYPE=RELEASE .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
