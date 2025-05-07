pkgname=agrum
pkgver=2.1.0
pkgrel=1
pkgdesc="C++ Bayesian networks library"
license=('LGPL')
arch=('x86_64')
url="http://agrum.gitlab.io/"
depends=('python-pydot' 'python-matplotlib' 'python-six' 'ipython' 'python-ipykernel' 'python-pandas' 'python-scikit-learn' 'python-cairosvg' 'unixodbc')
makedepends=('cmake')
source=("https://gitlab.com/agrumery/aGrUM/-/archive/${pkgver}/aGrUM-${pkgver}.tar.bz2")
sha256sums=('60449ba93f753275d3e587abfc2de03d7f83df42ac55cb670023b062f26ab9f4')

build() {
  cd "$srcdir/aGrUM-$pkgver"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_PYTHON=ON -DCMAKE_UNITY_BUILD=ON ..
  make
}

package() {
  cd "$srcdir/aGrUM-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
