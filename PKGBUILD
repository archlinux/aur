# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-dashing"
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal dashboards for Python"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

license=('LGPL-3.0')
arch=('any')

_url_pypi='https://pypi.org/project/dashing/'
_url_github='https://github.com/FedericoCeratto/dashing'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
depends=('python' 'python-blessed')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aeb56020ea2ae170a09498ff23f9c30cc76c02b83de3467e1262112578abbd9b')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
