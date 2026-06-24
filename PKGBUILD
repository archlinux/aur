# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="HoraDomu"
pkgname="vypl"
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight Python REPL with Vim like inputs"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('GPL-3.0-or-later')
arch=('any')

_url_github="https://github.com/${pkgauthor}/${pkgname}"
_url_pypi="https://pypi.org/project/${pkgname}/"
url=${_url_github}

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-cwcwidth' 'python-greenlet' 'python-pygments' 'python-watchdog' 'python-curtsies' 'python-pyxdg' 'python-jedi' 'python-pyperclip')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('72b952c9072291661f13147538b0d9ae224e282f9ef3c1269c9286e39724ba1c')

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
