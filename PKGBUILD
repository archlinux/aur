pkgname=agrum
pkgver=0.11.2
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('GPL')
arch=('i686' 'x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydotplus' 'python-matplotlib' 'ipython')
makedepends=('cmake' 'cococpp' 'swig' 'python')
source=("https://gitlab.com/agrumery/aGrUM/repository/archive.tar.bz2?ref=${pkgver}")
sha256sums=('65ce55ede74aa21737e4cefef76ed88d2f37c6b7b4332468289f1f94e80eebc5')

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
