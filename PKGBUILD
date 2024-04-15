# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-matrix-synapse-ldap3
pkgname=(python-matrix-synapse-ldap3)
pkgver=0.3.0
pkgrel=1
pkgdesc='An LDAP3 auth provider for Synapse'
license=('Apache-2.0')
arch=('any')
url='https://github.com/matrix-org/matrix-synapse-ldap3'
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-twisted' 'python-ldap3' 'python-ldaptor' 'python-pydantic' 'python-pyopenssl' 'matrix-synapse')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/matrix-org/matrix-synapse-ldap3/archive/v${pkgver}.tar.gz")
sha256sums=('6b4d845e09d870d4c94a9a62c5792e929f4376a15c22fc31b9671094844b642d')

build() {
	cd "matrix-synapse-ldap3-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "matrix-synapse-ldap3-${pkgver}"
	python -m twisted.trial -j$(nproc) tests
}

package_python-matrix-synapse-ldap3() {
	depends=('python' 'python-twisted' 'python-ldap3' 'python-service-identity')
	replaces=('python2-matrix-synapse-ldap3')

	cd "matrix-synapse-ldap3-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
