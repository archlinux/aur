# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-brick
pkgname=python-$_pyname
pkgver=5.0.0
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
	mypy
	bandit
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
md5sums=('0647f7a64719b760383e4435cb0025ce')
sha256sums=('0edc7eea855a5376c390d987593a55b121ab03735d6991d838b7f16821e6bfb9')
sha512sums=('cefe64bdd9a128db3fb05f371b562d9112de788332458d8903ea05b8063bca0e3920e4574cdc82372c50aee0a203d0343aea4efc96d5c16bcd995671321a5438')

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
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mv "$pkgdir"{/usr,}/etc
}
