# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.middleware
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=4.2.0
pkgrel=1
pkgdesc="Oslo Middleware library"
arch=('any')
url="https://docs.openstack.org/oslo.middleware/latest/"
license=('Apache')
depends=(
	python
	python-pbr
	python-jinja
	python-oslo-config
	python-oslo-context
	python-oslo-i18n
	python-oslo-utils
	python-stevedore
	python-webob
	python-debtcollector
	python-statsd
)
makedepends=(python-setuptools)
checkdepends=(
	python-fixtures
	python-hacking
	python-oslotest
	python-testtools
	python-coverage
	python-oslo-serialization
	bandit
	python-stestr
	python-pre-commit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('70355dcacd3dfc00c31f4067536044d2')
sha256sums=('f6bb2b2896737bf37c8f0ff034fd74245b7a1d2d5cb1252b672b44fbe3249d88')
sha512sums=('09afa9420149a2ca917c26a4bb7eec98634b2fa18b0579b5c97306e549eda799d094b985b0c1772f624839b8d0366b45e1cb8418d8c2dd39155a961bd90d3e62')

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
}
