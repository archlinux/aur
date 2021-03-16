# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=keystonemiddleware
pkgname=python-$_pyname
pkgver=9.2.0
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
md5sums=('b0f2273005bf9c771d9ac3399b46dc4d')
sha256sums=('b6f967c3a3edc6e2ed6109368a862396df87a9ea50bd710bac21758258c2f860')
sha512sums=('b2b8bd5fe07c8f6821abbcb4ba9ef26c5e60f9e4cb6eb6f938273cbe0fe84c53819a1b86b7e2d1e1b66419adcb9eb51e14e6f0e3419518cb2ba81cb751e0ded2')

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
