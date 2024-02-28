# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-pymystem3'
_pkgname=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
epoch=0
pkgdesc='A Python wrapper of the Yandex Mystem 3.1 morphological analyzer.'
arch=('x86_64')
url='https://github.com/nlpub/pymystem3'
license=('MIT')
depends=('mystem')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-requests: Loading of mystem binary.')
source=("python-pymystem3.tar.gz::https://github.com/nlpub/pymystem3/archive/refs/tags/${pkgver}.tar.gz"
        'python-pymystem3.diff')
sha256sums=('98e05da95073a822fbf7c04be7c0aa95d3a040b6ea8e13a0a9c8e4ad3e4cde0a'
            'SKIP')

prepare() {
    cd ${_pkgname}-${pkgver}
    patch -p1 -i ../python-pymystem3.diff
}

build() {
    cd ${_pkgname}-${pkgver}
    python -m build -nw
}

package() {
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        ${_pkgname}-${pkgver}/dist/${_pkgname}-${pkgver}-*.whl
}
