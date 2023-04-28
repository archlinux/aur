# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-formulaic'
_pkgname='formulaic'
pkgver='0.6.0'
pkgrel=1
pkgdesc="A high performance of Wilkinson formulas in Pythonn"
url="https://github.com/matthewwardrop/formulaic"
depends=(python
    python-astor
    python-interface-meta
    python-numpy
    python-pandas
    python-scipy
    python-typing_extensions
    python-wrapt)
checkdepends=(python-pytest python-sympy)
optdepends=(python-pyarrow python-sympy)
makedepends=(python-build python-hatch-vcs python-hatchling python-installer python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('49c7464d6b51256b06f9fa66b700a2e57dbde21b9288dcfa89e26ac68a207d34')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation

}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=. pytest tests
}
