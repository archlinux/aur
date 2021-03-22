# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular
_pycname=XStatic-Angular
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.5.8.0
pkgrel=1
pkgdesc="Angular 1.5.8 (XStatic packaging standard)"
arch=(any)
url="http://angularjs.org/"
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
md5sums=('15384e734161d31ff18a644f9632f25b')
sha256sums=('b1dcdd7a66d3041625698bba2ac480ffc2447b05f551f10fcae2ac33139eb033')
sha512sums=('87bc6ba1f83a12e2e57f35585ea67c6d4d78b843cc2d8dbf7db972b097f81aefa86f06b389677a7cf2f614c5ca54ebdf2289a62355b0e04847c2fac7d55423e1')

prepare(){
	cp -a $_pycname-$pkgver{,-py2}
}

build(){
	pushd $_pycname-$pkgver
	python setup.py build
	popd
	pushd $_pycname-$pkgver-py2
	python2 setup.py build
	popd
}

_package_python(){
	depends=(
		python
		python-xstatic
	)
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
	)
	cd $_pycname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
