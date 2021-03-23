# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jquery-tablesorter
_pycname=XStatic-JQuery.TableSorter
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.14.5.2
pkgrel=1
pkgdesc="JQuery.TableSorter 2.14.5 (XStatic packaging standard)"
arch=(any)
url="https://github.com/Mottie/tablesorter"
license=(MIT GPL2)
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
md5sums=('024a8dd83aa173ec0b161e76391ba56c')
sha256sums=('bdd847ca0cde4014fd21134f99e59a99ef488185c745e82646911d2f9de3d762')
sha512sums=('f43aa875e18f89c070682d5aaaf33d1dbbfc655f310ee94c1917e3b4fc7585aacbfcc2fb52b56cf45092bb7992f057b27dc7776dd55996b0b43605236f3dafc1')

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
