# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-resource-classes
pkgname=python-$_pyname
pkgver=1.0.0
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
md5sums=('7f45566123c269a2336cda7b7cd08203')
sha256sums=('a948458fc37828b5421758bd5a61c6981207d6b2373354c39ccf12f0ad742bf6')
sha512sums=('a5daef5a53e7a164bbe863af9a27e2a5ce92b490099769e7e545a059e80bbd0c74f1ec28afe1622820686b0614e5bc6e748598454d6b380891eb8a0b20333e37')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd "$srcdir"/$_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
