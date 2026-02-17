# Maintainer: Peter Züger <zueger.peter@icloud.com>

_name=bitstruct
pkgname=python-${_name}
pkgver=8.22.1
pkgrel=1
pkgdesc="This module performs conversions between Python values and C bit field structs represented as Python byte strings"
arch=('x86_64')
url="https://github.com/eerimoq/${_name}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=('python')
source=(${_name}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('0914abf8282cdc79b786564971a0f4b5405b19f10cbb6580c821ddf14feacb07')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check(){
    cd $_name-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m unittest discover -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
