# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname='clox'
_pkgauthor='sepandhaghighi'
pkgname=python-${_pkgname}
pkgver=1.7
pkgrel=1
pkgdesc="A Geeky Clock for Terminal Enthusiasts"

arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')

provides=("${_pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'ipython' 'python-colorama' 'python-pytz' 'python-art' 'python-pytz' 'python-jdatetime' 'python-jalali-core')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('76304098aa6c313cac511e968961ed7d56d23fea1a414b6d6fa271cfeae5a1ca')

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
