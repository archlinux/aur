# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=bashate
pkgname=python-$_pyname
pkgver=2.0.0
pkgrel=1
pkgdesc="A pep8 equivalent for bash scripts"
arch=(any)
url="http://docs.openstack.org/developer/bashate/"
license=(Apache)
depends=(
	python
	python-pbr
	python-babel
)
makedepends=(
	python
	python-hacking
	python-mock
	python-coverage
	python-discover
	python-fixtures
	python-subunit
	python-sphinx
	python-openstackdocstheme
	python-testtools
	python-stestr
	python-reno
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('8143df66c83808ab25a59319da236fb1')
sha256sums=('eb990cf07c0ca09ee06f3b7eff79232a2d6eff9d2bdf141e8126efebb0521a17')
sha512sums=('f6bacddcad1077d034df0de4313b13aa24ba4c60baa456912d1f40511830a58ca118a72193d4cac358963870e097bee4b0e2ae5a7f7aec42f0ba1663180eb401')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

## Test was broken
check(){
	cd $_pyname-$pkgver
	stestr run
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
