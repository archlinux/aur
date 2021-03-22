# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic
_pycname=XStatic
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.0.2
pkgrel=2
pkgdesc="XStatic base package with minimal support code"
arch=(any)
url="https://github.com/xstatic-py/xstatic"
license=(MIT)
makedepends=(
	python
	python2
	python-setuptools
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('dea172b7b14b0dbcd5ed63075221af4b')
sha256sums=('80b78dfe37bce6dee4343d64c65375a80bcf399b46dd47c0c7d56161568a23a8')
sha512sums=('a8d613ed29defe5e1dc62b637063fc260260c32f90e5ef85beb68e88b599722cf8efd57547c5f40576558aea2ac9b1ff7bd2fe6b214658f15b60c6756899f09e')

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
	depends=(python)
	cd $_pycname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	sed -i 's/;/;\n/g' $pkgdir/usr/lib/python*/site-packages/${_pycname}-${pkgver}-py*-nspkg.pth
}

_package_python2(){
	depends=(python2)
	cd $_pycname-$pkgver-py2
	python2 setup.py install --root "$pkgdir" --optimize=1
	sed -i 's/;/;\n/g' $pkgdir/usr/lib/python*/site-packages/${_pycname}-${pkgver}-py*-nspkg.pth
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
