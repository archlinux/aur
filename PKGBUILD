# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=htmltools
_srcname="py-${_name}"
pkgname="python-${_name}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Tools for creating, manipulating, and writing HTML from Python"
arch=('any')
url="https://github.com/posit-dev/py-htmltools"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('ipython' 'python-packaging>=20.9' 'python-typing_extensions' 'python')
checkdepends=('python-pytest>=6.2.4' 'python-syrupy>=4.6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/posit-dev/${_srcname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d10efba3976c3154460ebbcf5652c2dc53ca5e9760db923742c7720c70c2aed3d5982d22eeefa97d62da75e405e56e7e60201c92652e49bd68e7eb29ede34c0d')

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
