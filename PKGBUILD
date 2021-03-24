# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jquery-colourpicker
_pycname=XStatic-jquery-colourpicker
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.0.0.1
pkgrel=1
pkgdesc="jquery-colourpicker 1.0.0 (XStatic packaging standard)"
arch=(any)
url="http://andreaslagerkvist.com/jquery/colour-picker/"
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
md5sums=('f9826f4a0758ba8c9a403f9353c20e9e')
sha256sums=('1b9766d6042786ba1fefa5c28ff646ad20ba685f98c831fc00d9473175dd2d35')
sha512sums=('063bc8a2e03a8ae7cbb7da2a87058cdb57ad8543f71c784a73b1ce4ef0873c367d86f54fa53fb7162e0b8d46ef6c0874cc4e49754eb633e0e8d249c56baead0c')

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
