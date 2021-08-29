# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=keystonemiddleware
pkgname=python-$_pyname
pkgver=9.3.0
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
md5sums=('5f71a675a68a8ea88d75e3669931a8d1')
sha256sums=('02b951ce96da6348a63216cf4e2e781ac3f15af5fa4023c12e53f8cb22e23583')
sha512sums=('4d892003555adabfc7c7c4a71aa550263955c081369ac6c55e66f7441e9bb5716a2b346f9c13aab53cdace01958370142e7c662b456d55d9cd50409ee08b82d0')

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
