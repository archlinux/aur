# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=xstatic-roboto-fontface
_pycname=XStatic-roboto-fontface
pkgbase=python-$_pyname
pkgname=(python{,2}-$_pyname)
pkgver=0.5.0.0
pkgrel=1
pkgdesc="roboto-fontface 0.5.0 (XStatic packaging standard)"
arch=(any)
url="https://github.com/choffmeister/roboto-fontface-bower"
license=(Apache)
makedepends=(
	python
	python-xstatic
	python-setuptools
	python2
	python2-xstatic
	python2-setuptools
)
source=(https://pypi.io/packages/source/${_pycname::1}/$_pycname/$_pycname-$pkgver.tar.gz)
md5sums=('32273ba68fa063623461db0b0767524f')
sha256sums=('6d272df58e20eec3a15bca279163f38614c7074e2fecb537a58b29d109e83f62')
sha512sums=('69aa26b571f1d8b6156b5e2fe77e7314abb39ddd308023bce44d3ad2cd50ba9721fdabf49f5657742a7574428b69953cb251b8b8b9b117dd7f43d35173320bc7')

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
