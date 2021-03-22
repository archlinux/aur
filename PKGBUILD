# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-gettext
_pycname=XStatic-Angular-Gettext
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.4.1.0
pkgrel=1
pkgdesc="Angular-Gettext 2.4.1 (XStatic packaging standard)"
arch=(any)
url="https://angular-gettext.rocketeer.be/"
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
md5sums=('6552973138d37609c776d2d8a049aabe')
sha256sums=('883192c9273b2d1b8dc69e605845f0d3a267698955e55dcde0e3a4defeae385b')
sha512sums=('c6419359ad36efec273f1751bed471917cd3402da71e42a58ace54acc799ef44fc0fc303bfadb488bc6bedbee741adf38783f76f328508dd53016f4c734ef34f')

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
