# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.9'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='ssh-lite'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="An easy encapsulation for paramiko library which contains only common operations"
arch=('any')
url='https://github.com/rainydew/ssh-lite'
license=('Apache-2.0')
depends=('python' 'python-graphviz')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('5b5e8d5747153cfbd72d5433ae87ce80d9ffd53101bc34d47099b40c79fa991b')


build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "PKG-INFO" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
