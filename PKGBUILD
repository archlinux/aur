pkgname=python-tensap
pkgver=1.1
pkgrel=1
pkgdesc="A Python package for the approximation of functions and tensors"
url="https://github.com/anthony-nouy/tensap"
arch=(any)
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-scipy' 'python-tensorflow')
source=("https://github.com/anthony-nouy/tensap/archive/v${pkgver}.tar.gz")
sha256sums=('4074eb9cb76460114c4e54a0558a948a6464a71dee53b384a0bf734f156986d3')

prepare() {
  cd "${srcdir}"/tensap-$pkgver
  curl -L https://github.com/anthony-nouy/tensap/commit/a5d26f4de04f2868f03d5a7932ca64d9d127c93a.patch | patch -p1 || :
}

build() {
  cd "${srcdir}"/tensap-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/tensap-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


