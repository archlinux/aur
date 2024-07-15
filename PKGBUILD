# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=htmltools
_srcname="py-${_name}"
pkgname="python-${_name}"
pkgver=0.5.2
pkgrel=1
pkgdesc="Tools for creating, manipulating, and writing HTML from Python"
arch=('any')
url="https://github.com/posit-dev/py-htmltools"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('ipython' 'python>=3.8' 'python-packaging>=20.9')
checkdepends=('python-pytest>=6.2.4' 'python-syrupy>=4.6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/posit-dev/${_srcname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b7f2ebae6eae90d0929c125a71aaf5f90468eaf277e041c50e81667e37bd3aaf3ad271252c0a25982c777ce9e12bdc29d01e23b50b206cdb91c9b4aa305fa4f7')

check() {
    cd $_srcname-$pkgver
    pytest
}

build() {
    cd $_srcname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_srcname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
