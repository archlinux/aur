# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-traits
pkgname=python-$_pyname
pkgver=2.9.0
pkgrel=1
pkgdesc="A library containing standardized trait strings"
arch=(any)
url="https://docs.openstack.org/os-traits/latest/"
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
	python-testscenarios
	python-testtools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('bc16e2b53abfb4337293fb42d482d7d4')
sha256sums=('1ccc8be569157d4a6a72c03f842fb64f7571bf4c85798837af29fc11a11ea100')
sha512sums=('7e93101f1c1fd89506491e91c717e498dae093fbb57fc45e89d740211fd963d70a7ce549f4c9fefd824249e488cfb01d9af1ec5b7aa319f72ebb3a68f0fa21a2')

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
