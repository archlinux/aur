# Maintainer: a821
# Contributor: Michel Zou

pkgname=python-opentsne
pkgver=1.0.2
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('fftw' 'python-scikit-learn')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
)
source=("https://pypi.io/packages/source/o/openTSNE/opentsne-${pkgver}.tar.gz")
sha256sums=('e2aecaa7a487100246f2d3fef9855d1bd6cc02a1c6da8fb2a54583f307aa4229')

build() {
  cd "opentsne-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "opentsne-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
