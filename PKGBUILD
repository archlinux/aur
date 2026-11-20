# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="Kaia-Alenia"
pkgname="alenia-nerve"
pkgver=7.1.0
pkgrel=1
pkgdesc="Ultra-fast local communication engine based on Unix Domain Sockets for sovereign creators"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('GPL-3.0')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_pypi_package#alenia-}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-cryptography' 'python-websockets' 'python-argon2-cffi')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eaef86b16b4afc4e0ab860b37648e665583cc58ce6c161f8ca05e476b3ddf3f2')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
