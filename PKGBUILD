# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jquery-ui
_pycname=XStatic-jquery-ui
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.12.1.1
pkgrel=1
pkgdesc="jquery-ui 1.12.1 (XStatic packaging standard)"
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
md5sums=('2d5569524c7936d82f41d833f3c84e62')
sha256sums=('d6ba48bb474420a8bcb2be02eef6ae96281ec24eff6befa54f04ebc9e4cc8910')
sha512sums=('68d28dccf28c0228bd6f35553cfa7e7cff73085c888ade0d6278fe11f464d0c85c33b35d6af04c2385ab83231398facb10fab6072bc5a5b5e805ee9c572fd01c')

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
