# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.6.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='async-cron'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Crontab for python, with asyncio"
arch=('any')
url='https://github.com/aohan237/async_cron'
license=('MIT')
depends=('python' 'python-arrow' 'python-dateutil')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("${_pypi_package}-${_upstreamver}.tgz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bd05ac13c2675f159d3c6cf02bcafed0de998584f7bb32238008bd8272ddd74b')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
