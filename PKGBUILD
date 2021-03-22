# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-schema-form
_pycname=XStatic-Angular-Schema-Form
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.8.13.0
pkgrel=1
pkgdesc="Angular Schema-Form 0.8.13.0 (XStatic packaging standard)"
arch=(any)
url="http://schemaform.io/"
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
md5sums=('d0faab81c36f4cfc03e092fedc30018d')
sha256sums=('7c08634901751267fe26d266fc027cf6ed2e5f422696985cec750594b3f4e300')
sha512sums=('878ea176074b1523af7193f8439966682e4ee4c99e6d50b4835ce4c136269998222b85b3a03811138696dcad72dd0aa646a43c45727a95379120f5228d30759b')

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
