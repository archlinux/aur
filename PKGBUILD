# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=htmltools
_srcname="py-${_name}"
pkgname="python-${_name}"
pkgver=0.6.0
pkgrel=2
pkgdesc="Tools for creating, manipulating, and writing HTML from Python"
arch=('any')
url="https://github.com/posit-dev/py-htmltools"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('ipython' 'python-packaging>=20.9' 'python-typing_extensions' 'python>=3.8')
checkdepends=('python-pytest>=6.2.4' 'python-syrupy>=4.6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/posit-dev/${_srcname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9fd807f82d6d537181d6a7a605908cffa1f131f80629da9fd34c4f3ffcd2d81c336acdf013c43889e82d1ea848d34002f8e6eb591374401795d01c1d09ba3ae6')

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
