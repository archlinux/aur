# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="spoj"
_appname="resilient-runner"

pkgname="python-${_appname}"
pkgver=0.1.1
pkgrel=1
pkgdesc="An async task runner with concurrency control, retries, and dynamic timeouts"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
url="${_url_pypi}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('048af364a75574324065ae290013ef0124d5e77105a4de0058dc38092c0c4a72')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
