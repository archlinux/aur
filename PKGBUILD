# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit
pkgver=16.1.0
pkgrel=1
pkgdesc="Tools for doing computation in game theory"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
makedepends=('cython' 'python-setuptools')
source=("https://github.com/gambitproject/gambit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de3e3d561cf46aeaec135efaf23f41ddef28968d9071251ca8cb6266babece62')
options=('!makeflags')

build() {
  cd "$pkgname-$pkgver"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  ./configure --prefix=/usr --disable-enumpoly
  make
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  python setup.py install --root="$pkgdir"
}
