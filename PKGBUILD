# Maintainer: a821
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-msgpack-numpy
pkgver=0.4.8
pkgrel=4
pkgdesc="Serialize numpy arrays using msgpack"
url="https://pypi.org/project/msgpack-numpy/"
depends=(python-numpy
         python-msgpack)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=(BSD-3-Clause)
arch=(any)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lebedov/msgpack-numpy/archive/${pkgver}.tar.gz")
sha256sums=('730a6fab30bf6656003d7322a834b3673a36a85949d0539d504665f63cd95a44')

prepare() {
    rm -fv "msgpack-numpy-${pkgver}/setup.cfg"
}

build() {
    cd "msgpack-numpy-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "msgpack-numpy-${pkgver}"
    python -m unittest -v
}

package() {
    cd "msgpack-numpy-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
