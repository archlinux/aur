# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-ken
pkgname=python-$_pyname
pkgver=2.1.0
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
md5sums=('06f8b0b63d9728567b21b1752642e49a')
sha256sums=('604dfadaf66657880962990d138df0685cd84428842a8daa7b3bf60f54c92f08')
sha512sums=('9e8e1ad506bcf44b28af64a7771773097ba338abf5dc19c3bf8299227bbcbb5b745aec38e585f5be6ae9f5426a0c32499f56bafdd2615846939bbdd2eac6c527')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	python os_ken/tests/run_tests.py
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 etc/os_ken/os_ken.conf "$pkgdir"/etc/os_ken/os_ken.conf
}
