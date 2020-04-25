# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2020.4.24.9.29.7
pkgrel=1
pkgdesc="Add built-in support for quaternions to NumPy"
url="https://quaternion.readthedocs.io/"
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-scipy')
optdepends=(
  "python-numba: speedup of numerical functions"
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/n/numpy-quaternion/numpy-quaternion-$pkgver.tar.gz"
)
sha256sums=(
  'a50687ea7d68b1acc923eb9d4fc60a831e578f8e91f132941b184a4b9b14777a'
)

build() {
    cd "numpy-quaternion-$pkgver"
    package_version="$pkgver" python setup.py build
}

check() {
    cd "numpy-quaternion-$pkgver"
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-$PYVER" PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
    cd "numpy-quaternion-$pkgver"
    package_version="$pkgver" python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
