# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-bootstrap-datepicker
_pycname=XStatic-Bootstrap-Datepicker
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.4.0.0
pkgrel=1
pkgdesc="Bootstrap-Datepicker 1.4.0 (XStatic packaging standard)"
arch=(any)
url="https://github.com/eternicode/bootstrap-datepicker/"
license=(Apache)
makedepends=(
	python
	python-xstatic
	python-xstatic-bootstrap
	python-setuptools
	python2
	python2-xstatic
	python2-xstatic-bootstrap
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('68375e81274159874ab5fd6d85ea405c')
sha256sums=('df33add9f5e785fa884ac4b182601af6aac9e1eeef7cfe62dbbcb0654d0f2d6e')
sha512sums=('81e117707e10f0e2bc511ebfbecaed42a9a388f71cddbe08c98b6c0b3984499e1499d4b0102ecdfaa8bd5f8fdb72bd338a9ab3acf74e038a8fe78a537f16c912')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
		python-xstatic-bootstrap
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
		python2-xstatic-bootstrap
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
