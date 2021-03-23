# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-tv4
_pycname=XStatic-tv4
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.7.0
pkgrel=1
pkgdesc="tv4 1.2.7 (XStatic packaging standard)"
arch=(any)
url="http://geraintluff.github.com/tv4/"
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
md5sums=('921148dff35fb41431d5f122da570248')
sha256sums=('9b4c57244e914126cdda5d8bc24698189d73800203c85b1fc945a08e25c7c713')
sha512sums=('02bf9d1ea79f8d0676e833ddd95c781772008798d8aed93cc8ebf6ff8f3c6ec947f7a0ab24c0c3d0d1e763f7e49134863291e10bf2cdfc291c09124a840346e8')

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
