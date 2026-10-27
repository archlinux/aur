# Maintainer: a821 at mail de

pkgname=python-pynndescent
pkgver=0.7.0
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD-2-Clause')
depends=('python-joblib' 'python-llvmlite' 'python-numba' 'python-numpy' 'python-scikit-learn' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz"
        "fix-tests.patch")
sha256sums=('54f097a003bfdb917225e1bcf55c4027e283a37a2b5e3cae4b4aaf21197f6d1c'
            '728d7f537c30df4ee7171d8be1e6dc96c4365f391470baab786429cbf638daa6')

prepare() {
  cd "pynndescent-$pkgver"
  patch -p1 < ../fix-tests.patch
}

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
