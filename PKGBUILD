# Maintainer: a821
# Contributor: Michel Zou

pkgname=python-opentsne
pkgver=0.7.1
pkgrel=2
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
)
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz")
sha256sums=('ff7cdd6982fef2b88fc758f571b32f25bf595e6ddbe406db6d3b40bf5242af5a')

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
