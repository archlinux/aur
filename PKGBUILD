pkgname=agrum
pkgver=3.2.0
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=(LGPL-3.0-or-later)
arch=('x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydot' 'python-matplotlib' 'python-six' 'ipython' 'python-ipykernel' 'python-pandas' 'python-scikit-learn' 'python-cairosvg' 'unixodbc')
makedepends=('cmake' 'swig')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('b8ac6ad30dcc8aa392e39ac09cf919c3ddc00ecc7630f7789b2b1c45fccc6203')

build() {
  cd "$srcdir/aGrUM-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_PYTHON=ON -DCMAKE_UNITY_BUILD=ON -DAGRUM_PYTHON_SABI=OFF -B build .
  cmake --build build
}

package() {
  cd "$srcdir/aGrUM-$pkgver"
  DESTDIR="$pkgdir" cmake --build build --target install
}
