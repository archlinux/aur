# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="backup-warden"
pkgver=1.0.16
pkgrel=1
pkgdesc="Streamline your backup management with ease and simplicity"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

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

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/${pkgver}.tar.gz")
sha256sums=('7b51bc50fd1271c09801a934ed5ba8a51c0c3f21796cd042fc6e994462a481cd')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
