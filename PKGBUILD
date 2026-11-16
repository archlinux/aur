# Maintainer: Daryl Richards <daryl at isle dot ca>

_upstreamver='4.8.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='netmiko'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=3
pkgdesc="Multi-vendor library to simplify CLI connections to network devices"
arch=('any')
url='https://github.com/ktbyers/netmiko'
license=('MIT')
depends=('python' 'python-paramiko' 'python-pyserial' 'python-textfsm' 'python-scp' 'python-yaml' 'python-ntc-templates' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('6264cf8afcbd9c10efb832bacabb9a89370452d522f6c20532d2ad0fefcbdd69')


build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "PKG-INFO" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
