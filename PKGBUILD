# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=keystonemiddleware
pkgname=python-$_pyname
pkgver=10.1.0
pkgrel=1
pkgdesc="Middleware for OpenStack Identity"
arch=(any)
url="https://docs.openstack.org/keystonemiddleware/latest/"
license=(Apache)
depends=(
	python
	python-keystoneauth1
	python-oslo-cache
	python-oslo-config
	python-oslo-context
	python-oslo-i18n
	python-oslo-log
	python-oslo-serialization
	python-oslo-utils
	python-pbr
	python-pycadf
	python-keystoneclient
	python-requests
	python-six
	python-webob
	python-memcached
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-flake8-docstrings
	python-coverage
	python-cryptography
	python-fixtures
	python-oslotest
	python-requests-mock
	python-stevedore
	python-stestr
	python-testresources
	python-testtools
	python-webtest
	python-oslo-messaging
	bandit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('51a8e6cea30bea9465a2b46601f3ff6a')
sha256sums=('e0926e669eb995655c2b5e56c509c0db48de0eea446a122c14ef25fbbb48ad6a')
sha512sums=('d386bd072726f036a3317b2b3d173581a2219e453dc5230efd4d5158a925e70b844f6fb10c321cbd276b0ce28829f29cc915743da41608648c1d482334e52530')

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
