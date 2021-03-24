# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-animate
_pycname=XStatic-Angular-Animate
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.1.1
pkgrel=1
pkgdesc="Angular-Animate 1.2.1 (XStatic packaging standard)"
arch=(any)
url="https://angularjs.org/"
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
md5sums=('01df0010fffabc1db43e4aba4fcff378')
sha256sums=('88af1f8edb66ac76e6fb0c59f1127af8473760fa54d4983d4118e2ba776c015a')
sha512sums=('e569028ad3d68e9fa4fb0d5c1779b9445e137d4d2cc0c58be2b574d930f173cccf339732d45f95024064411401672c973776da4b2c735bbf4fe443b720d60732')

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
