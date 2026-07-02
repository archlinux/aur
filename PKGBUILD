# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-inquirer-textual"
pkgver=0.6.1
pkgrel=1
pkgdesc="Versatile library for user input in Python"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

url="https://github.com/${_author}/${_pypi_package}"
arch=('any')
license=('MIT')

depends=('python' 'python-rich' 'python-textual' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('d8b0c959e4e58fd730a2fc3da4c92612bef757db1c664399cc7534be8c5b757a')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
    cp -rf "examples/"* "${pkgdir}/usr/share/doc/${pkgname}/examples/"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
