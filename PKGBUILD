# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-ken
pkgname=python-$_pyname
pkgver=1.4.0
pkgrel=1
pkgdesc="A component-based software defined networking framework for OpenStack."
arch=(any)
url="http://docs.openstack.org/os-ken/latest"
license=(Apache)
depends=(
	python
	python-pbr
	python-eventlet
	python-msgpack
	python-netaddr
	python-oslo-config
	python-ovs-wrapper
	python-routes
	python-six
	python-tinyrpc
	python-webob
)
makedepends=(
	python-setuptools
	python-sphinx
	python-openstackdocstheme
	python-reno
)
checkdepends=(
	python-hacking
	python-coverage
	python-subunit
	python-oslotest
	python-stestr
	python-testtools
	python-nose
	python-pycodestyle
	python-pylint
	python-ncclient
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('5ca67c39a3aebb38a60a660b18ed9764')
sha256sums=('256614dbe468f1f5bf16dfb290598c856e9a40f61269556d90e43ca8b5b0a1c8')
sha512sums=('671e56a3195746b668127bf3b11fa896a03c4f0303869d075f7cec85bfa4307900c48ce00e8df68071895c06a3c5126c2f15f395e086e499ae63aa5063abd523')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd "$srcdir"/$_pyname-$pkgver
	python os_ken/tests/run_tests.py
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 etc/os_ken/os_ken.conf "$pkgdir"/etc/os_ken/os_ken.conf
}
