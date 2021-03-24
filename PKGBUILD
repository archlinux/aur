# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-cookies
_pycname=XStatic-Angular-Cookies
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.1.1
pkgrel=1
pkgdesc="Angular-Cookies 1.2.0 (XStatic packaging standard)"
arch=(any)
url="http://angularjs.org/"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-xstatic-angular
	python-setuptools
	python2
	python2-xstatic
	python2-xstatic-angular
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('a67066fac5dfe9774ab163d44e5a896a')
sha256sums=('c8fc1a52549c601809fc9f25144e4fd346820412b6430e89256e7ec71fce0b4c')
sha512sums=('3de281ad11385ab18b5cd7f8b775a9cbbb2906a5e01ec8828e14e28f357dd7aeed28cf67f156bf7e63bfa8cd2f6c4ee294c0fab1bc69df81c6d96345f8ed9c48')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
		python-xstatic-angular
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
		python2-xstatic-angular
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
