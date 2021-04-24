# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pymemcache
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.4.2
pkgrel=1
pkgdesc="A comprehensive, fast, pure Python memcached client"
arch=(any)
url="https://github.com/pinterest/pymemcache"
license=(Apache)
makedepends=(
	python
	python-six
	python-setuptools
	python2
	python2-six
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('4e5373344ffe0d549e7332f8b69b1192')
sha256sums=('ff6f7db6893e05e30b259b25ca399181d1d20eb6f78b8c999448be997f26745f')
sha512sums=('e46ca0a311eed40f716e812898eb601e3ebef8b5c09bdbd41923a0fd03297377e37c97bdec3c5df5c4e46b05653d8cfc2f4fb6f3b2ad5a451b36e8c6b1c8a340')

prepare(){
	cp -a $_pyname-$pkgver{,-py2}
	sed -i '1s/ python$/ python2/g' $(find $_pyname-$pkgver-py2 -name '*.py')
}

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
	pushd $_pyname-$pkgver-py2
	python2 setup.py build
	popd
}

## Test was broken
#check(){
#	pushd $_pyname-$pkgver
#	python -m pytest
#	popd
#	pushd $_pyname-$pkgver-py2
#	python2 -m pytest
#	popd
#}

_package_python(){
	depends=(
		python
		python-six
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_package_python2(){
	depends=(
		python2
		python2-six
	)
	cd $_pyname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
