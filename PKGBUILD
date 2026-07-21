# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgauthor="tox-dev"
pkgname="pipdeptree"
pkgver=4.1.0
pkgrel=1
pkgdesc="Command line utility to show dependency tree of Python packages"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('x86_64')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")

makedepends=('cargo' 'python-wheel' 'python-build' 'python-installer' 'meson-python' 'python-ninja' 'ninja')
depends=('glibc' 'libgcc' 'python' 'python-typing_extensions' 'python-graphviz' 'python-rich')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6eb7e671ffa06ef597d683680d483a4882a86a2a00494971733bd88a3404c44f')

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
