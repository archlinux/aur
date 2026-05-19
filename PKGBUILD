# Maintainer: Daryl Richards <daryl at isle dot ca>

_upstreamver='4.7.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='netmiko'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Multi-vendor library to simplify CLI connections to network devices"
arch=('any')
url='https://github.com/ktbyers/netmiko'
license=('MIT')
depends=('python' 'python-paramiko' 'python-poetry' 'python-pyserial' 'python-textfsm' 'python-scp')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('94cf7bfe5daed1d058444ce1637e10177df22f903683a53d1fbee47553488c65')


build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "PKG-INFO" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
