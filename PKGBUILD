# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=neutron-lib
pkgname=python-$_pyname
pkgver=2.11.0
pkgrel=1
pkgdesc="Neutron shared routines and utilities"
arch=(any)
url="https://docs.openstack.org/neutron-lib/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-sqlalchemy
	python-pecan
	python-keystoneauth1
	python-netaddr
	python-stevedore
	python-os-ken
	python-oslo-concurrency
	python-oslo-config
	python-oslo-context
	python-oslo-db
	python-oslo-i18n
	python-oslo-log
	python-oslo-messaging
	python-oslo-policy
	python-oslo-serialization
	python-oslo-service
	python-oslo-utils
	python-oslo-versionedobjects
	python-osprofiler
	python-setproctitle
	python-webob
	python-os-traits
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-os-api-ref
	python-reno
)
checkdepends=(
	python-hacking
	bandit
	python-coverage
	python-fixtures
	python-flake8-import-order
	python-pylint
	python-isort
	python-subunit
	python-oslotest
	python-reno
	python-stestr
	python-testresources
	python-testscenarios
	python-testtools
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('17ebfe300b7aef78f03b09b821fe7d84')
sha256sums=('af47a5c1f84f05a281038625064b7f0e6c6856d56c3ec3fb06184789acef4685')
sha512sums=('3488a5904c972e55ba1b47742caa4ccb99eacfc1a4962fad9d1e89d99ef85e51fbd17a5f9b75004d3237fa5adcf00babe43c47b6505b745c167f0b33296402fa')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
