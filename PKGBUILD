# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.7.6'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='termgraph'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Python command-line and library that draws basic graphs in the terminal"
arch=('any')
url='https://github.com/mkaz/termgraph'
license=('MIT')
provides=(${_pypi_package})
depends=('python' 'python-colorama')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('0a86f6033cec461785ca4ffae19b394c788820fa9beab17f9d2eb83068e1fe60')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -vDm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/data" data/*.{dat,py}

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
