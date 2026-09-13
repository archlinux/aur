# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="a-shygun"
pkgname="dripfetch"
pkgver=0.2.2
pkgrel=1
pkgdesc="A customizable terminal system information display with animated rain"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('bash' 'python' 'python-psutil' 'python-ruamel-yaml')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e40cf734999ff5423e6a6d5aa18430ed6e3fc8498eacd69028a1184113605147')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
