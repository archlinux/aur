# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-ollama-flow"
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python library for the Ollama API"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

arch=('any')
url='https://pypi.org/project/ollama-flow'
license=('MIT')
depends=('ollama' 'python' 'python-requests' 'python-pydantic')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz"
        "LICENSE")
sha256sums=('54c74d574e6ead1340c139a1ef9c7aa0d8a2405a68b69a60269295259412f066'
            '5934ed2ce0d15154bcdb9c85203210abac0da4314af34081e36df4599f90b226')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
