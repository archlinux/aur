# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-brick
pkgname=python-$_pyname
pkgver=6.1.0
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
md5sums=('36263ef94c71a8a660bf281c346f03c4')
sha256sums=('b3fbd2f3fd2f05ed5ab6259bf8a89465412014b75157b437121fda42c3532aae')
sha512sums=('6dd27f32d8552f9189c2c86f54dccc5cf9bed06a57eda66dbd89f32cd02898466a8b99ea9a6849967fa63336516cb881c02e86d97b0424ad984754886ac7a595')

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
