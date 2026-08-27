# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="manzik"
pkgname="cmdbench"
pkgver=0.1.22
pkgrel=1
pkgdesc="Quick and easy resource usage monitoring and benchmarking for any command's CPU, memory, disk usage and runtime"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}""

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-poetry' 'python-poetry-core')
depends=('python' 'python-scipy' 'python-tqdm' 'python-pkg_resources' 'python-click' 'python-matplotlib' 'python-psutil' 'python-numpy' 'python-colorama' 'python-beeprint')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c072af38ad3e0d6275eaade083d6a9d10c909611f1310d4481900d6cf48b124c')

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
