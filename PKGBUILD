# Maintainer: Brian Thompson <brianrobt at pm dot me>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="BrianPugh"
_appname="autoregistry"

pkgname="python-${_appname}"
pkgver=1.3.1
pkgrel=2
pkgdesc="Automatic registry design-pattern library for mapping string names to code functionality."

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('Apache-2.0')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-hatch-vcs'
)
depends=('python' 'python-pydantic' 'python-pydantic-core')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('3110c5054fd6fb1f972c7adbfc9df8cfa49ab3ce6c90c0d465625db310a3cb6d')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
