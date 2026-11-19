# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-kajson"
pkgver=0.8.0
pkgrel=1
pkgdesc="Powerful universal JSON encoder/decoder for Python objects"

arch=('any')
license=('Apache-2.0')
url='https://github.com/Pipelex/kajson'

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

depends=('python' 'python-pydantic' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('57ef84b04a2522872247335f05dbe58b48e031ea0e0ad209b3a58c54c27a67be')


build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
