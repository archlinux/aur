# Maintainer: a821
pkgname=python-pynndescent
pkgver=0.5.11
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('6f44ced9d5a9da2c87d9b2fff30bb5308540c0657605e4d5cde7ed3275bbad50')

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
