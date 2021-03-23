# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jsencrypt
_pycname=XStatic-JSEncrypt
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=2.3.1.1
pkgrel=1
pkgdesc="JSEncrypt 2.3.1 (XStatic packaging standard)"
arch=(any)
url="http://travistidwell.com/jsencrypt/"
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
md5sums=('4b03331d4b2f6c12e2e4b8ee6056bda0')
sha256sums=('a277912a4f70d1d2f58c8d94b992d244e69fcf851a2cbed5d83cb4fc422a72f2')
sha512sums=('9e130f3c554a986016f5a429514642804408d357ead24ae6f144ba3bcb8d88c50b16ae42e685f009646fd9abfba61f39e41f2860b351e824fbb31fc24eeec1e4')

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
