# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pytest-cython'
_pkgname='pytest-cython'
pkgver='0.2.1'
pkgrel=1
pkgdesc="A plugin for testing Cython extension modules."
url="https://github.com/lgpage/pytest-cython"
checkdepends=('cython' 'python-nox' 'python-pytest')
depends=()
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('38d10faee6fc974a9240dccf9f85dc2534baf6be6e02a3fc77a9db8b6a5b0558')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$_pkgname-${pkgver}/tests"
    pushd example-project > /dev/null
    python setup.py build_ext --inplace
    popd > /dev/null
    cd ..
    PY_IGNORE_IMPORTMISMATCH=1 PYTHONPATH=src pytest
}
