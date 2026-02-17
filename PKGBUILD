# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.0.15'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='backup-warden'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Streamline your backup management with ease and simplicity"

license=('GPL-3.0')
arch=('any')

_url_pypi='https://pypi.org/project/backup-warden'
_url_github='https://github.com/charles-001/backup-warden'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-poetry-core')
depends=('python' 'python-dateutil' 'python-invoke' 'python-slack-sdk' 'python-tabulate' 'python-packaging' 'python-simpleeval' 'python-loguru' 'fabric' 'python-boto3' 'python-requests' 'backup-warden' 'python-botocore' 'python-humanfriendly' 'python-paramiko')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e858fba08f6b37a5900b9ad38ae90c4bee18102386bdd35ff9104be3564aed0f')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
