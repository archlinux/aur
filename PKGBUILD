# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular
_pycname=XStatic-Angular
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.8.2.1
pkgrel=1
pkgdesc="Angular 1.8.2 (XStatic packaging standard)"
arch=(any)
url="http://angularjs.org/"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-setuptools
	python2
	python2-xstatic
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('429e5b05c631cc162f41672ce20762bc')
sha256sums=('e23a887ae371294a8580ce19259898b97372782b00a077f0a9643e05b72e2b96')
sha512sums=('2a4778687ad178c8cfe49a8f97c4b3a04d2e6d5053d7d98a22b6e71e038e447483334486c0e391b4320c5dae627eb602e6bf6f2c45693142c2b0c688d6d0dff9')

prepare(){
	cp -a $_pycname-$pkgver{,-py2}
}

build(){
	pushd $_pycname-$pkgver
	python setup.py build
	popd
	pushd $_pycname-$pkgver-py2
	python2 setup.py build
	popd
}

_package_python(){
	depends=(
		python
		python-xstatic
	)
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
	)
	cd $_pycname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
