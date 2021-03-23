# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-mdi
_pycname=XStatic-mdi
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=1.6.50.2
pkgrel=1
pkgdesc="mdi 1.6.50 (XStatic packaging standard)"
arch=(any)
url="http://materialdesignicons.com/"
license=(MIT Apache)
makedepends=(
	python
	python-xstatic
	python-setuptools
	python2
	python2-xstatic
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('aa720e603fce607681cc69989fbd41a9')
sha256sums=('be1005af7a593b0b3a349aadb05e4160ea65894248a47b246c6658345e2f10c1')
sha512sums=('3b769502e4886726269838806f6631ba2f55bf2fb74a64ab4c62efb706456030415e045923a6290f93f936afd01908ab19feaabb6648e32e0ce672938c9dc08c')

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
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
	find "$pkgdir" -perm -0222 -exec chmod 0644 {} \;
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
