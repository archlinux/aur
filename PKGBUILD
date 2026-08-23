# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

_appauthor="brentyi"
_appname="tyro"

pkgname="python-${_appname}"
pkgver=1.0.16
pkgrel=1
pkgdesc="Strongly typed, zero-effort CLI interfaces"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
depends=('python' 'python-msgspec' 'python-docstring-parser' 'python-pydantic' 'python-pytorch' 'python-typeguard' 'python-typing_extensions' 'python-attrs' 'python-yaml' 'python-universal_pathlib' 'python-shtab')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('a20c6e2c186930013a5fb3f20295c9c479a7a5e26db27fe0e003419494e3114a')


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
