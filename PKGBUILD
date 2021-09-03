# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-traits
pkgname=python-$_pyname
pkgver=2.6.0
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
md5sums=('dcc26929cfcf86e7cc9bd50c2649567c')
sha256sums=('1fa1a638f630c0b4a2c2a2aadae9f09948e5aced74840b647ab601a082226605')
sha512sums=('57f46678c1859af09f0e13e491760bddd818b7779716d91197f9fa45c6b195bb023a4de5fface68a95a87bf66547b27d74addb66cde043bd571a0eca176ee53b')

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
