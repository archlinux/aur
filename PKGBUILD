# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname='mytimer'
_pkgauthor='sepandhaghighi'
pkgname="${_pkgname}"
pkgver=2.6
pkgrel=1
pkgdesc="A Geeky Timer for Terminal Enthusiasts"

arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')

conflicts=("python-${pkgname}")
depends=('python' 'python-nava' 'python-art' 'python-jdatetime' 'python-colorama')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5c891ab9d018a8d01eea4fcb9bff6f75d413ed5ee725436691f422319df6b63c')

_pypi_package=${_pkgname}
_pypi_version=${pkgver}


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "AUTHORS.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
