# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=neutron-lib
pkgname=python-$_pyname
pkgver=2.10.1
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
md5sums=('93246f73811fa6f8a5a7faa6a4df9aaa')
sha256sums=('32c1005500aa0a8efd8dc09d1c6a3cb7241f5a237b0fd3e38524c4a12142849c')
sha512sums=('1f1d088153cce18b369cacc3757a65143240494f785744254b8096cc083e3a5ab49001493a99f24a47a5f0176fb3bb4bf0c3b739d98f0486f991bc1928a06b6e')

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
