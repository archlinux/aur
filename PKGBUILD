# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-xnum"
pkgver=1.5
pkgrel=1
pkgdesc="Simple and lightweight Python library that helps you convert digits between different numeral systems"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url='https://github.com/openscilab/xnum'

depends=('python')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8fa163eaf4050f5c664ff1ab7a6f09005a21d4500464049ad3b3537f864d8fdc')


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
