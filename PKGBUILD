# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-bootstrap
_pycname=XStatic-Bootstrap
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=4.5.3.1
pkgrel=1
pkgdesc="Bootstrap 4.5.3 (XStatic packaging standard)"
arch=(any)
url="https://getbootstrap.com/"
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
md5sums=('2e70ba547e7d17aa0b0c428ebf3ebcd0')
sha256sums=('cf67d205437b32508a88b69a7e7c5bbe2ca5a8ae71097391a6a6f510ebfd2820')
sha512sums=('ac7d1105c85e0365b92ad637d812d8bd022bcb850b85483655ebac973f1802b6e7d5ee7ae2fe5c449c7c6a1fc9de4d9904df6ee497add4dd78f3d2e146bd7277')

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
