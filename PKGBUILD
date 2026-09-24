# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-custodian
_pkgname=custodian
pkgver=2025.12.14
pkgrel=1
pkgdesc="A simple, robust, and flexible JIT job management framework for error correction"
arch=('any')
url="https://github.com/materialsproject/custodian"
license=('MIT')
depends=(
    'python'
    'python-monty'
    'python-psutil'
    'python-ruamel-yaml'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
