# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="aria2tui"
pkgver=0.1.13.5
pkgrel=1
pkgdesc="A TUI Frontend for the Aria2c Download Manager"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/aria2tui/'
_url_github='https://github.com/grimandgreedy/aria2tui'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'aria2' 'python-pyperclip' 'python-toml' 'python-requests' 'python-tabulate' 'python-numpy' 'python-plotille' 'listpick')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/v${pkgver}.tar.gz")
sha256sums=('43c8b19f6dacb17530f001688317d01f295c5f6dc554916dceef284c6ff5540e')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${pkgdir}/usr/~/.config/aria2tui/config.toml" "${pkgdir}/usr/share/doc/${pkgname}/CONFIG"
    rm -rf "${pkgdir}/usr/~"
}
