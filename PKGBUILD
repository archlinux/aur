# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor="PhantomLambSoft"
_gitname="CmdBox"

pkgname=${_gitname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc="A cross-platform command manager for terminal workflows"

_pypi_package=${pkgname}-cli
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_gitname}/"
_url_github="https://github.com/${_gitauthor}/${_gitname}"
url=${_url_github}

provides=("${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('bash' 'python' 'python-argcomplete' 'python-pyperclip' 'python-rich' 'python-textual' 'python-typing_extensions' 'python-unidiff' 'ansible-core' 'python-ensurepath')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64ee5a26e2caf57e8accf8bffb06432f336a309cb0ddbe193cb96fe9a0ce2a83')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    mv "${pkgdir}/usr/bin/cb" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
