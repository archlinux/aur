# Maintainer: Daryl Richards <daryl at isle dot ca>

_upstreamver='2.1.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='textfsm'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="An easy encapsulation for paramiko library which contains only common operations"
arch=('any')
url='https://github.com/google/textfsm'
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('45c18ff2b7c90163dfdff7e20d3f482514cc7aac26bc2547744e79dfa761e458')


build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "PKG-INFO" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
