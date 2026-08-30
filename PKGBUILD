# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-kajson"
pkgver=0.7.1
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
sha256sums=('725f5c02c065f829d4b4e409553b6016258784a77de2140246a96c851c64f362')


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
