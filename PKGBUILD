# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-bootswatch
_pycname=XStatic-bootswatch
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.3.7.0
pkgrel=1
pkgdesc="bootswatch 3.3.7 (XStatic packaging standard)"
arch=(any)
url="http://bootswatch.com/"
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
md5sums=('422f09e076ff1741b76a9f7554ceca32')
sha256sums=('93ee5863c1ec07212fe12ae137a10708b4102720391d460f061dd3f441ba3b6e')
sha512sums=('507888801c921e0686868ae4a8d2fcb9245c4d644afe51bc838cfaef8136a2badc2534d58bda03753511a05d82e40213f74d31fc25e389a3f79ee3961999d43f')

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
