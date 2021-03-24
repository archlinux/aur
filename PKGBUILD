# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-mock
_pycname=XStatic-Angular-Mock
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.1.1
pkgrel=1
pkgdesc="Angular-Mock 1.2.1 (XStatic packaging standard)"
arch=(any)
url="http://angularjs.org/"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-xstatic-angular
	python-setuptools
	python2
	python2-xstatic
	python2-xstatic-angular
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('94f072c39c2070f3939b619d913fb37f')
sha256sums=('ffee6edfab8276abd8057ddc28c4d8503424c0c61938e787720766862ef43e42')
sha512sums=('3ad74d21a804f4e0b9b314b34745012f291b674e8d8c4de1425e560c4c405ba9c1a2600d2fd16ac77cf162bf0ed4390d52f6017b12142d69fe399be1ef6ba812')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
		python-xstatic-angular
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
		python2-xstatic-angular
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
