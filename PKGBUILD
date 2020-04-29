# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2020.4.29.8.34.20
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
  'bbe5448ccd7b166fee9c37141d3e56822f3f5b423963f349071a53d0a25bd51d'
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
