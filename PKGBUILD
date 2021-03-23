# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-hogan
_pycname=XStatic-Hogan
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.0.0.3
pkgrel=1
pkgdesc="Hogan 2.0.0 (XStatic packaging standard)"
arch=(any)
url="http://twitter.github.io/hogan.js/"
license=(Apache)
makedepends=(
	python
	python-xstatic
	python-setuptools
	python2
	python2-xstatic
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('b9b7610ba5c16e9ba398efb83d26a656')
sha256sums=('27a921963e470abbada15b2d85d198833795aaead5fd73339bc2883cfddb5619')
sha512sums=('d52e4f5a79e1d1b96c262ec33ffae313f968e0c8770718bbf29f361746875395541bd36871423ccdadb9b67fbfd8251e4dc476d0d2a366b0e03855484e1b7986')

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
