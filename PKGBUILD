# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-font-awesome
_pycname=XStatic-Font-Awesome
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=4.7.0.0
pkgrel=1
pkgdesc="Font-Awesome 4.7.0 (XStatic packaging standard)"
arch=(any)
url="https://fortawesome.github.io/Font-Awesome/"
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
md5sums=('141a0e9a7e21e82f922573a00ae0c166')
sha256sums=('e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c')
sha512sums=('2913e51d38aca70b2d7df29d0af4356fb9e0ea3c00ba3fafc10446fe7e1d9a18ed10500bb565f2a71642784c631f7fdf3f89462515582107f184e833b68c4c71')

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
