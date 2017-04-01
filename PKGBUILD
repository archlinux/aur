pkgname=agrum
pkgver=0.11.1
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('GPL')
arch=('i686' 'x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydotplus' 'python-matplotlib' 'ipython')
makedepends=('cmake' 'cococpp' 'swig' 'python')
source=("https://gitlab.com/agrumery/aGrUM/repository/archive.tar.bz2?ref=${pkgver}")
sha256sums=('f2e9105464dc1fbb2873ba118244888a978232006eb39beb46b5f2e245a6065b')

prepare() {
  mv aGrUM-0.11.1-dcfc66b25d4edd3156471ec655c9c6092e6a3327/ $pkgname-$pkgver
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
