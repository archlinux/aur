# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname="python-greenery"
pkgver=4.2.3
pkgrel=1
pkgdesc="Greenery allows manipulation of regular expressions as finite state machines"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

arch=('any')
url='https://github.com/qntm/greenery'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
# checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package}/${_pypi_package}-${_pypi_version}.tar.gz")
sha256sums=('546e8d2764949f6999d7cb56a5cbb0dc9be38f34489ce2abb95db622dac7b2cd')

prepare() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"
}

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

# check() {
#     cd "${srcdir}/${_pypi_package}-${_pypi_version}/"
#
#     pytest --dist no -n 0 -s -v ./
# }

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
