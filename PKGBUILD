# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pytest-cython'
_pkgname='pytest-cython'
pkgver='0.3.1'
pkgrel=1
pkgdesc="A plugin for testing Cython extension modules."
url="https://github.com/lgpage/pytest-cython"
checkdepends=(cython python-pytest)
depends=(cython python python-pytest python-setuptools)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4264474a8a6a2801256ad80f03e96552bd96848ddbcc3f1a7e37d7fa9a494455')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

#check() {
    #cd "$_pkgname-${pkgver}"
    #pushd example-project > /dev/null
    #python setup.py build_ext --inplace
    #popd > /dev/null
    #cd ..
    #PY_IGNORE_IMPORTMISMATCH=1 PYTHONPATH=src pytest tests
#}
