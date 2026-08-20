# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-matrix-synapse-ldap3
pkgver=0.4.0
pkgrel=1
pkgdesc='An LDAP3 auth provider for Synapse'
license=('Apache-2.0')
arch=('any')
url='https://github.com/matrix-org/matrix-synapse-ldap3'
depends=('python' 'python-twisted' 'python-ldap3' 'python-service-identity' 'python-packaging' 'matrix-synapse')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-ldaptor' 'python-pydantic' 'python-pyopenssl')
_srcname='matrix-synapse-ldap3'
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-synapse-ldap3/archive/v${pkgver}.tar.gz")
sha256sums=('52afdd69961ee78e0dd48441398da57594908fb901814c1cea29233db81f1fdf')

build() {
	cd "${_srcname}-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_srcname}-${pkgver}"
	python -m twisted.trial -j$(nproc) tests
}

package() {
	replaces=('python2-matrix-synapse-ldap3')

	cd "${_srcname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
