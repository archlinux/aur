# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jquery
_pycname=XStatic-jQuery
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.5.1.1
pkgrel=1
pkgdesc="jQuery 3.5.1 (XStatic packaging standard)"
arch=(any)
url="https://jquery.com/"
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
md5sums=('ed522ddb3ac0064988f19491d0a28f72')
sha256sums=('e0ae8f8ec5bbd28045ba4bca06767a38bd5fc27cf9b71f434589f59370dcd323')
sha512sums=('9794ff19c0458aa32f6be33e5947965f66ff587d76b349dfbd136031d1e2776a8d0f537a3340784be5834152cb4dd2e1133d3580ba750160a5f4c66cc3660755')

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
