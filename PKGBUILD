# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=automaton
pkgname=python-$_pyname
pkgver=2.3.0
pkgrel=1
pkgdesc="Friendly state machines for python."
arch=(any)
url="https://opendev.org/openstack/automaton"
license=(Apache)
depends=(
	python
	python-pbr
	python-prettytable
)
checkdepends=(
	python-coverage
	python-oslotest
	python-stestr
	python-testtools
	python-reno
)
makedepends=(
	python
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('6d627a428a84ba03b0b4146dede1d45b')
sha256sums=('3173a5fdbbb14ab4c6c53ea5c8f82c337fe4b3dc5a3dcd7d1804fd685868cf2e')
sha512sums=('3e832f2cbaa147b57bcef024873454dbcb4e800d3873f4f6e533b137e49fee3cfe39efdacbfd700819c8c5f09e61f14d2862efc0daa78f79ad0e6f9c75161f8e')

build(){
	pushd $_pyname-$pkgver
	python setup.py build
}

check(){
	pushd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
