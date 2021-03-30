# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-brick
pkgname=python-$_pyname
pkgver=4.3.1
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
md5sums=('f4e87e6a16bcc6a7d9fc4eb65d91dc26')
sha256sums=('9be84c1d08d904923e77d6f3c6425149c13489a2c6b4858d0e967dfeffa91a9b')
sha512sums=('83d1b48fff46a0b61639be7e3422997c0784cb46347c60eaa30e37ec2b77f1789d82d48dd4f2914b4232bbcfcede143256828c59bf73539453e0f93fb54ab440')

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
