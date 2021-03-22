# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-lrdragndrop
_pycname=XStatic-Angular-lrdragndrop
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.0.2.4
pkgrel=1
pkgdesc="Angular-lrdragndrop 1.0.2.4 (XStatic packaging standard)"
arch=(any)
url="https://github.com/lorenzofox3/lrDragNDrop"
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
md5sums=('6c6c7969bfa89701db2b316162b36291')
sha256sums=('5d3cce15a6342814811ddc372c6035bf4026253664c0b72a660b481cb183ae1b')
sha512sums=('5828382536d27cdfaf4eb2e35f0718c3201b10cad939fc086818e9a3052501660f07cddaf8525ca162aab307789243228880cacfe69b9a4acab77017a4b6ba89')

prepare(){
	sed -i '2s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
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
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
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
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
