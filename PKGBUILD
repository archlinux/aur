# Maintainer: a821
pkgname=python-pynndescent
pkgver=0.5.13
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD-2-Clause')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('d74254c0ee0a1eeec84597d5fe89fedcf778593eeabe32c2f97412934a9800fb')

build() {
  cd "pynndescent-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "pynndescent-$pkgver"
  pytest
}

package() {
  cd "pynndescent-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
