# Maintainer: a821 at mail de

pkgname=python-pynndescent
pkgver=0.6.0
pkgrel=2
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD-2-Clause')
depends=('python-joblib' 'python-llvmlite' 'python-numba' 'python-numpy' 'python-scikit-learn' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz"
        "fix-tests.patch")
sha256sums=('7ffde0fb5b400741e055a9f7d377e3702e02250616834231f6c209e39aac24f5'
            'b98f2852179daecb9b2e67bf88d9b355b3ca003a9fc75769e9264bd0bcabbb9a')

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
