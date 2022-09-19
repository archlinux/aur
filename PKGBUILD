# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jquery-ui
_pycname=XStatic-jquery-ui
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.13.0.1
pkgrel=1
pkgdesc="jquery-ui 1.13.0 (XStatic packaging standard)"
arch=(any)
url="https://jqueryui.com/"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-xstatic-jquery
	python-setuptools
	python2
	python2-xstatic
	python2-xstatic-jquery
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('b9db251ea04e06f06db458abef903c16')
sha256sums=('3697e5f0ef355b8f4a1c724221592683c2db031935cbb57b46224eef474bd294')
sha512sums=('66958f89d6cf0a599cdee998587b26ad7bcdb353649fc42d53950a314331a2e7102a4576a2a289dc508b6c8d259bc96d0acdf8c3fc1bc9572de8d4f87b9ae9db')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
		python-xstatic-jquery
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
		python2-xstatic-jquery
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
