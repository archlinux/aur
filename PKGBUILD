# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=neutron-lib
pkgname=python-$_pyname
pkgver=2.15.0
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
md5sums=('b15f9a00836bf4f403468aaf9c58c371')
sha256sums=('88a25675fedc6760443fbc4180357e6437160bf5237eae132f05f7114eba0508')
sha512sums=('8d8ddf708f43c183f6a3a91c296ee6eaf9c70e562da4e16522b85a6484ffc44183d07ab82de389b0a4e7e5305386fdd9e707e853815ef79951028b6ae7c1930e')

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
