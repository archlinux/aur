# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="mvw"
pkgver=0.6.0
pkgrel=1
pkgdesc="MoVie revieW inspired by fastfetch"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('GPL-3.0')
arch=('any')

_url_pypi='https://pypi.org/project/mvw/'
_url_github='https://github.com/fatinul/mvw'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-rich-pixels' 'python-typer' 'python-rich' 'python-platformdirs' 'python-beautifulsoup4' 'python-requests' 'python-click' 'python-omdbapi' 'python-iterfzf')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('d279daa8da7f3d089d5ecf3d5a7ab9f4e60e5b6339cbdd542cdc192871f847ca')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
