# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: SZanko szanko at protonmail dot com

pkgauthor=fabiocaccamo
pkgname=python-fsutil
pkgver=0.19.0
pkgrel=1
pkgdesc="High-level file-system operations for lazy devs"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url="https://github.com/${pkgauthor}/${pkgname}"

depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c9594b02c0d7e6655b0b05a3e800036faac07ad50ab7e4ee1cad798922e4e99b')


build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "SECURITY.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
