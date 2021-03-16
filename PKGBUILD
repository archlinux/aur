# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=pymemcache
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.4.1
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
md5sums=('438913139cd3bf589ad2e39fed390ffe')
sha256sums=('deba75d6d16206e846916570cf9fabd4cf7d7c72ec86e3bdcc65e032f01418e9')
sha512sums=('ff70fc47c5f22ba7f472e2de016d39fd3ce4d277e6e31bbedde5934966fb65fb8d4bc1e8a6a878757c472a24a9704d4a1536b66643789294a3ba12ef3a83c7cd')

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
#	pushd "$srcdir"/$_pyname-$pkgver
#	python -m pytest
#	popd
#	pushd "$srcdir"/$_pyname-$pkgver-py2
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
