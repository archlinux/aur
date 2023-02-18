pkgname=python-opentsne
pkgver=0.7.0
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
)
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz")
sha256sums=('70417d6abe2c323068a51d38e873bc42dde571e12a80539da152c312acc42db7')

prepare() {
  cd "openTSNE-$pkgver"
  sed -i 's/oldest-supported-//' pyproject.toml
}

build() {
  cd "openTSNE-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "openTSNE-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
