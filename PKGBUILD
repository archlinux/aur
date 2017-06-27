pkgname=agrum
pkgver=0.12.0
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('GPL')
arch=('i686' 'x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydotplus' 'python-matplotlib' 'ipython')
makedepends=('cmake' 'cococpp' 'swig' 'python')
source=("https://gitlab.com/agrumery/aGrUM/repository/archive.tar.bz2?ref=${pkgver}")
sha256sums=('fd67a0b51ad5f96bbbfd3556c63cc2c1f6054104686cbcd327c51f21b4c3c6e2')

prepare() {
  # remove sha suffix
  mv aGrUM-${pkgver}-* $pkgname-$pkgver
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
