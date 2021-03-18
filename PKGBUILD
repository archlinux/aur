# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslo.versionedobjects
_pycname=${_pyname/./-}
pkgname=python-${_pycname}
pkgver=2.4.0
pkgrel=1
pkgdesc="Oslo Versioned Objects library"
arch=('any')
url="https://docs.openstack.org/oslo.versionedobjects/latest/"
license=('Apache')
depends=(
	python
	python-oslo-concurrency
	python-oslo-config
	python-oslo-context
	python-oslo-messaging
	python-oslo-serialization
	python-oslo-utils
	python-iso8601
	python-oslo-log
	python-oslo-i18n
	python-webob
	python-netaddr
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-sphinx
	python-reno
	python-mock
	python-fixtures
)
checkdepends=(
	python-hacking
	python-oslotest
	python-testtools
	python-coverage
	python-jsonschema
	python-stestr
	python-fixtures
	python-pre-commit
	bandit
)
options=('!emptydirs')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('c6f722cd72fadfcb09e6b42278ce553a')
sha256sums=('f0149e557d962365f53e61b7ce0aa4d7037d2d83a0db4fecba1e964fd4949926')
sha512sums=('d3ee20fb5b5743005db7fafa655e9129910d1aba838ad8609dc76849b10b7ebce5afc71e385fb95364cd3598673697b13fe398342516e25b577b4cc3e7bbbddf')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	PYTHONPATH=$PWD stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}
