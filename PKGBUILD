# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-ken
pkgname=python-$_pyname
pkgver=2.3.0
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
md5sums=('a111c05123c30ac879d8f417494b6476')
sha256sums=('9eb24c72b66aeb928ab505332a037ba070d902b434c4366701eb40914e628fbe')
sha512sums=('7e71b0c25f9e5a9b9a14fff913d796349e2c8a6630956ed6cc069eb008fec702dfde41b3a6751d05d683948e75e170c432ffb8c19b0e2ebf95f5a19f9b2a6f17')

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
