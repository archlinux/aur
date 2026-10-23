pkgname=agrum
pkgver=3.3.0
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=(LGPL-3.0-or-later)
arch=('x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydot' 'python-matplotlib' 'python-six' 'ipython' 'python-ipykernel' 'python-pandas' 'python-scikit-learn' 'python-cairosvg' 'unixodbc')
makedepends=('cmake' 'swig')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('edc12e55ee0ce7b30b2e7addcd5552f5de72b0d807004110f41fdf2c403d8dc0')

build() {
  cd "$srcdir/aGrUM-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_PYTHON=ON -DCMAKE_UNITY_BUILD=ON -DAGRUM_PYTHON_SABI=OFF -B build .
  cmake --build build
}

package() {
  cd "$srcdir/aGrUM-$pkgver"
  DESTDIR="$pkgdir" cmake --build build --target install
}
