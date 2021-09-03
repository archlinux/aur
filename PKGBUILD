# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-resource-classes
pkgname=python-$_pyname
pkgver=1.1.0
pkgrel=1
pkgdesc="Resource Classes for OpenStack"
arch=(any)
url="https://docs.openstack.org/os-resource-classes/latest/"
license=(Apache)
depends=(
	python
	python-pbr
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
	python-oslotest
	python-stestr
	python-testtools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('3d9a25ddcd68b5d1fdec0981271b896e')
sha256sums=('e0bcbb8961a9fe33b7213734c51c001812890e2be62101c9279c88b72f75f9eb')
sha512sums=('957bab6bd9fb4463401e207852382ecaa3179098faaa42eea84cbec0879560406db87a893f6c20868a200bfff54c6935a41d85c95081cf04dc6c33941f52f3d4')

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
}
