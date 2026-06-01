# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=udapi
pkgname="python-${_pkgname}"
pkgver=0.5.2
pkgrel=1
pkgdesc="Python framework for processing Universal Dependencies data"
arch=('any')
url="https://github.com/udapi/udapi-python"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-colorama'
    'python-termcolor'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bea62dd380a885a485cb7810ce69d5154ba3f9345140e6198e0b39858ecb9ae8')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
