# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_name=htmltools
_srcname="py-${_name}"
pkgname="python-${_name}"
pkgver=0.5.3
pkgrel=1
pkgdesc="Tools for creating, manipulating, and writing HTML from Python"
arch=('any')
url="https://github.com/posit-dev/py-htmltools"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('ipython' 'python>=3.8' 'python-packaging>=20.9')
checkdepends=('python-pytest>=6.2.4' 'python-syrupy>=4.6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/posit-dev/${_srcname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('65e6bdcc04b8d4c7cf55307935041f09989a00879a15b02571dee6917010b2cef614f745847ee7c492342d6989c3b148a0265176ed77bea5770effe6924050bb')

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
