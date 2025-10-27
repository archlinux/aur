# Maintainer: getzze <getzze at_gmail dot_com>
# Based on python-tslearn PKGBUILD
pkgname=python-tslearn-git
pkgver=r1694.19e8ab8
pkgrel=1
pkgdesc="A machine learning toolkit dedicated to time-series data. Version from the latest commit."
arch=('x86_64')
url='https://github.com/rtavenar/tslearn'
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-numba' 'python-joblib' 'python-scikit-learn')
optdepends=('python-pytorch' 'python-h5py' 'python-keras-applications' 'python-keras-preprocessing' 'python-pandas' 'python-stumpy' 'python-cesium')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-build' 'python-wheel' 'python-installer')
provides=('python-tslearn')
conflicts=('python-tslearn')
options=(!emptydirs)
source=("git+https://github.com/rtavenar/tslearn.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/tslearn"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/tslearn"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/tslearn"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

