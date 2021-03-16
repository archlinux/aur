# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.messaging
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=12.7.1
pkgrel=1
pkgdesc="Oslo Messaging API"
arch=('any')
url="https://docs.openstack.org/oslo.messaging/latest/"
license=('Apache')
depends=(
	python
	python-pbr
	python-futurist
	python-oslo-config
	python-oslo-log
	python-oslo-utils
	python-oslo-serialization
	python-oslo-service
	python-stevedore
	python-debtcollector
	python-cachetools
	python-webob
	python-pyaml
	python-amqp
	python-kombu
	python-oslo-middleware
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-fixtures
	python-stestr
	python-pre-commit
	python-testscenarios
	python-testtools
	python-oslotest
	python-pifpaf
	python-confluent-kafka
	python-coverage
	python-pyngus
	bandit
	python-eventlet
	python-greenlet
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('b8dbdee8dc9fd4c9ab5e577d27730de0')
sha256sums=('a42fd620aab63a4015b58db8daf938a59055a172e97702e324f41b7802aec947')
sha512sums=('ec89a454b4167aeb9c92af1e7f8a5906d47928971e8d20da01e352d92d9679cc5a09adf8a5e5598f152b44c9b531cd61a4e74ba79d7df1037f488e277277d01a')

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
