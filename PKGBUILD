# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-rickshaw
_pycname=XStatic-Rickshaw
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.5.1.0
pkgrel=1
pkgdesc="Rickshaw 1.5.1 (XStatic packaging standard)"
arch=(any)
url="http://code.shutterstock.com/rickshaw/"
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
md5sums=('aef17022c8a0ea3d9e2da6237d5175ef')
sha256sums=('cf278d4bd4e974ddcf7170d20bbb706cc34f93cf61658f2f68f3138374178564')
sha512sums=('f8fd6a5031b56d790aa30a2388f5db72aa7fb0b3da696c008de99464650394733155fac0d822422ef52bc12887711b3d325673e4b0f25aca045cda007b97c8cb')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
