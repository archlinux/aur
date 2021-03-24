# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-angular-material
_pycname=XStatic-Angular-Material
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.1.5.2
pkgrel=1
pkgdesc="Angular-Material 1.1.5 (XStatic packaging standard)"
arch=(any)
url="https://github.com/angular/material"
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
md5sums=('c82019d66b3d7749d0cae6e2bfe30b9f')
sha256sums=('98e387cb457220707fd48614007ae05c5f2ab106dfee7e0a54d00358a8343032')
sha512sums=('2fbbbaa791b7f5dfcc855ef3cd6c3a7586e18e667161e87e7be70b94a50780b5ba31813645e2bafc1760e3623af9a9490df82af620da514cf1d3ae84a1d50b75')

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
