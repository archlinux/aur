# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="qingshuinisha"
_appname="async-task-runner"

pkgname="python-${_appname}"
pkgver=1.0.3
pkgrel=1
pkgdesc="An asyncio-based asynchronous task runner, ready to use out of the box"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
url="${_url_pypi}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('ab995709daa71da027e2fadd6887aace65448d667bc9debed219461bb61ed889')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
