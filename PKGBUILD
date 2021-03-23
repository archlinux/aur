# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-jquery-migrate
_pycname=XStatic-JQuery-Migrate
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=3.3.2.1
pkgrel=1
pkgdesc="JQuery-Migrate 3.3.2 (XStatic packaging standard)"
arch=(any)
url="https://github.com/jquery/jquery-migrate"
license=(MIT)
makedepends=(
	python
	python-xstatic
	python-xstatic-jquery
	python-setuptools
	python2
	python2-xstatic
	python2-xstatic-jquery
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('83382e3198c37ae0e011b693eb553106')
sha256sums=('986f979a0e2da0a45341a033691811147fdf6eaa97a706b7ab3d9e7711cead6e')
sha512sums=('0fb4f1c5b86a1063a2bd2366f5c153b4f7c66a7cba2d492ca9a518c452a87765c30b0eb1a1a141c817d7d20dfeaf7143ad60747b8805d77aa9aeef89697a7292')

prepare(){
	sed -i '1s/from xstatic.pkg //g' $_pycname-$pkgver/setup.py
	cp -a $_pycname-$pkgver{,-py2}
}

_package_python(){
	depends=(
		python
		python-xstatic
		python-xstatic-jquery
	)
	cd $_pycname-$pkgver
	export PYTHONPATH=${PWD}/xstatic/pkg
	python setup.py install --root "$pkgdir" --optimize=1
}

_package_python2(){
	depends=(
		python2
		python2-xstatic
		python2-xstatic-jquery
	)
	cd $_pycname-$pkgver-py2
	export PYTHONPATH=${PWD}/xstatic/pkg
	python2 setup.py install --root "$pkgdir" --optimize=1
}

eval "package_python-${_pyname}(){ _package_python; }"
eval "package_python2-${_pyname}(){ _package_python2; }"
