# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-pytest-local
_pkgname=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc='Simple forking server for testing with reusable context'
arch=('any')
url='https://github.com/daskol/pytest-local'
license=('MIT')
groups=()
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/daskol/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c63259eb57349566b735a37ad70730fa7e43577cd89d7e4e66a08c69fb204159')

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --prefix $pkgdir \
        $_pkgname-$pkgver/dist/*.whl
}
