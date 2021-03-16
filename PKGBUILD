# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-brick
pkgname=python-$_pyname
pkgver=4.3.0
pkgrel=1
pkgdesc="OpenStack Cinder brick library for managing local volume attaches"
arch=(any)
url="https://docs.openstack.org/os-brick/"
license=(Apache)
depends=(
	python
	python-pbr
	python-eventlet
	python-oslo-concurrency
	python-oslo-context
	python-oslo-log
	python-oslo-i18n
	python-oslo-privsep
	python-oslo-serialization
	python-oslo-service
	python-oslo-utils
	python-requests
	python-tenacity
	python-os-win
)
makedepends=(
	python-setuptools
	python-openstackdocstheme
	python-reno
	python-sphinx
	python-os-api-ref
	python-sphinxcontrib-apidoc
	python-sphinx-feature-classification
)
checkdepends=(
	python-hacking
	python-flake8-import-order
	python-coverage
	python-ddt
	python-oslotest
	python-testscenarios
	python-testtools
	python-stestr
	python-oslo-vmware
	python-castellan
	python-pycodestyle
	python-doc8
	python-fixtures
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('3de9e9b7a4c348e6efb370a109861f75')
sha256sums=('c778da541ec63440b578c7669d130e05908b32b4db7e661491f51ab0f58bad4e')
sha512sums=('5c07422afd9f83692c13f3fe184f9ffd2c0f05b4d5f688405b9083c1c5a6f8dafd57bf928aedad49a0ab025479845cf950282ff376fdfe7046d3836a4f9603b0')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd "$srcdir"/$_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mv "$pkgdir"{/usr,}/etc
}
