# Maintainer: a821
# Contributor: Michel Zou

pkgname=python-opentsne
pkgver=1.0.4
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('fftw' 'python' 'python-joblib' 'python-numpy' 'python-scipy' 'python-scikit-learn')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
  'python-numba'
)
source=("https://pypi.io/packages/source/o/openTSNE/opentsne-${pkgver}.tar.gz")
sha256sums=('e90bf612be94fcbe06e3cab9531a58e4824661f38dd7c2e934569820d15c82ab')

build() {
  cd "opentsne-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "opentsne-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
