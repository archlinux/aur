# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-ken
pkgname=python-$_pyname
pkgver=2.5.0
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
md5sums=('3d68ae037c3652d7957ec16feb1e521f')
sha256sums=('1901decc5521f1a0b73d42f25759ba0bba2af39fd4e26eaccae836912ea2dac6')
sha512sums=('c692221bd7aed53fd1e0f3baa4d1c885f308bb9eb1679fd4b15463d90c374841aa1630d84dd7af48f951af8cb577db382bfeecf350cd9bb7ad35d1b9518e3901')

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
	install -Dm644 etc/os_ken/os_ken.conf "$pkgdir"/etc/os_ken/os_ken.conf
}
