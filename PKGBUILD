# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.1.6'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='rich-inquirer'
_author='chosey0'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Interactive CLI prompts using Rich and readchar, inspired by python-inquirer"
url="https://github.com/${_author}/${_pypi_package}"

arch=('any')
license=('MIT')

depends=('python' 'python-rich' 'python-readchar' 'python-rapidfuzz')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('cfa9f8f342ede0ac7483c609457a5aec2669ca25ef2a1b5bba861c01e61bc2f5')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
