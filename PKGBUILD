# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jquery-quicksearch
_pycname=XStatic-JQuery.quicksearch
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.0.3.2
pkgrel=1
pkgdesc="JQuery.quicksearch 2.0.3 (XStatic packaging standard)"
arch=(any)
url="http://plugins.jquery.com/jquery.quicksearch/"
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
md5sums=('ac6148cfff5a7a90240e7801bf9f0e4a')
sha256sums=('f38760fe93b504f2855ef25e9bf91df65c8a6601674165e4685fb217bb616fd1')
sha512sums=('08578fcb448cd5b2234d19fae361f2f63361222be1e0218ef04fcdda9e1377077bdd018cfa684e3736c1837108b1937a8923426747a9cd852729ed585019d092')

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
