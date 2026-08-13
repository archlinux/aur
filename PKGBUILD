# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.1.6'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='rich-inquirer'


_pkgauthor='chosey0'
_pkgname='rich-inquirer'
pkgname="python-${_pkgname}"
pkgver=0.1.10
pkgrel=1
pkgdesc="Interactive CLI prompts using Rich and readchar, inspired by python-inquirer"

_pypi_package=${_pkgname}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url="https://github.com/${_pkgauthor}/${_pkgname}"

depends=('python' 'python-rich' 'python-readchar' 'python-rapidfuzz')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('3ded128f2f38f1f71d14455fd58a954c317bed512a6904d2e8281c26246bbcf3')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
