# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-smart-table
_pycname=XStatic-smart-table
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.4.13.2
pkgrel=1
pkgdesc="smart-table 1.4.13 (XStatic packaging standard)"
arch=(any)
url="https://github.com/lorenzofox3/Smart-Table"
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
md5sums=('21640f39d064ea292de9e8e7b33f9595')
sha256sums=('f2fa5ed37c2953253de79c61c346fa6c3c4f38731295d2240552c14298db6b0a')
sha512sums=('8e456de973b5462caa7e70cdb45890c6f1e79b694372e46803001e893fa0ad86ed2fc0668478f8f3c2ea7dcc4fb96c9c3ff4b09e5eb1da4fce882b362d7aa8e3')

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
