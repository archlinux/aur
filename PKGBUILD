# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular
_pycname=XStatic-Angular
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.8.2.2
pkgrel=1
pkgdesc="Angular 1.8.2 (XStatic packaging standard)"
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
md5sums=('8ea82b44420dfebb0994d92d5d2f4a02')
sha256sums=('4c816ad5a1f992b1d63cd2975e3c1262fca08672f5986e1838abb64ed75c8323')
sha512sums=('4fcd94eac9886c831fefa47db329014459df3a0df11f70e2b86c15af528224137d6c781cce4503844c47ba7ff2cf0d3bf405dc924f655c964286bbaf57f08661')

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
