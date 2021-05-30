# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=os-api-ref
pkgname=python-$_pyname
pkgver=2.2.0
pkgrel=1
pkgdesc="Sphinx Extensions to support API reference sites in OpenStack"
arch=(any)
url="https://docs.openstack.org/os-api-ref/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-pyaml
	python-six
	python-sphinx
	python-openstackdocstheme
)
checkdepends=(
	python-hacking
	python-coverage
	python-subunit
	python-testrepository
	python-testtools
	python-sphinx-testing
	python-beautifulsoup4
	python-stestr
)
makedepends=(
	python
	python-setuptools
)
source=("https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('499c648060b5f2bf9b9bf1bcdf32ff32')
sha256sums=('50394bc71edd2926e3a385ca7b5174e8a6ac79b9f601f0630d5afed8bdf7fbba')
sha512sums=('3d25b3cd702c611577c86c206a60f92d929191f9e75c210e04c639c2a597ea58d31c81c17b79e41276c3e5b391e2c7bb95a9d7483b0f248e230d03550da3af96')

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
