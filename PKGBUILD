pkgname=python-tensap
pkgver=1.0
pkgrel=1
pkgdesc="A Python package for the approximation of functions and tensors"
url="https://github.com/anthony-nouy/tensap"
arch=(any)
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-scipy' 'python-tensorflow')
source=("https://github.com/anthony-nouy/tensap/archive/v${pkgver}.tar.gz")
sha256sums=('e0828ad9b2a330d996b2ce4a445980dd7bc22e79573abb7b36ff0920779b8a9d')

prepare() {
  cd "${srcdir}"/tensap-$pkgver
  curl -L https://github.com/anthony-nouy/tensap/commit/a5d26f4de04f2868f03d5a7932ca64d9d127c93a.patch | patch -p1 || echo "ok"
}

build() {
  cd "${srcdir}"/tensap-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/tensap-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


