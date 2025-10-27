# Maintainer: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-opentsne-git
pkgver=1.0.4.r2.g6287bbf
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('fftw' 'python' 'python-joblib' 'python-numpy' 'python-scipy' 'python-scikit-learn')
makedepends=('cython' 'git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/pavlin-policar/openTSNE.git")
sha256sums=('SKIP')

pkgver () {
  cd "openTSNE"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "openTSNE"
  python -m build --wheel --no-isolation
}

package() {
  cd "openTSNE"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
