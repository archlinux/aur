# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=htmltools
_srcname="py-${_name}"
pkgname="python-${_name}"
pkgver=0.6.1
pkgrel=1
pkgdesc="Tools for creating, manipulating, and writing HTML from Python"
arch=('any')
url="https://github.com/posit-dev/py-htmltools"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('ipython' 'python-packaging>=20.9' 'python-typing_extensions' 'python')
checkdepends=('python-pytest>=6.2.4' 'python-syrupy>=4.6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/posit-dev/${_srcname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4ec472f9168e3c8a3b0e9120fd320fa6c2964003a1084e5be0c87c1c6d9a22ae26ed262ee6e87fdd0160efa3780cbd690256b03eaa78319c586ce14038742892')

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
