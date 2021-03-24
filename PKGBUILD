# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-sanitize
_pycname=XStatic-Angular-Sanitize
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.2.1.1
pkgrel=1
pkgdesc="Angular-Sanitize 1.2.1 (XStatic packaging standard)"
arch=(any)
url="http://angular-ui.github.io/Sanitize/"
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
md5sums=('322929c54d7e28882095136049c540ba')
sha256sums=('0e5dcc517cfa71fdd639188d00b057cdcacd00029898b72f021eb4db23fab93d')
sha512sums=('0a9d894dfe9426103eb94cd67d97df64d19a7fac4d69743d71adbbaf85b0454bae1eab62848d518f68d92893ac3af137d3fd960bfcee001b2a714e51a46edde2')

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
